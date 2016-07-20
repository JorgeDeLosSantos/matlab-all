// QuadTree implementation compatible with ViewManager system

/*
 * CONFIDENTIAL AND CONTAINING PROPRIETARY TRADE SECRETS
 * Copyright 2007 The MathWorks, Inc.
 * The source code contained in this listing contains proprietary and
 * confidential trade secrets of The MathWorks, Inc.  The use, modification,
 * or development of derivative work based on the code or ideas obtained
 * from the code is prohibited without the express written permission of The
 * MathWorks, Inc. The disclosure of this code to any party not authorized
 * by The MathWorks, Inc. is strictly forbidden.
 * CONFIDENTIAL AND CONTAINING PROPRIETARY TRADE SECRETS
 */
mathworks.module({
	
    name: "mathworks/quadtree/quadtree.jsm",
    
    requires: ["mathworks/loadscheduler/loadscheduler.jsm", 
	           "mathworks/util/assert.jsm", 
			   "mathworks/util/idmanager.jsm"],
    
    definition: function(context){
    
        if (!mathworks.quadtree) {
            mathworks.quadtree = {};
        }
        
        mathworks.quadtree.create = function(){
            function createQuadTree(getQuadTreeTileURL, maxTileSize, scheduler){
                // -----------------------------------------------------------------
                // Define some geometry-related helper functions
                //  TBD - should these get their own package?
                
                function resizeElement(e, rect){
                    e.style.left = rect.left.toString() + 'px';
                    e.style.top = rect.top.toString() + 'px';
                    e.style.width = rect.width.toString() + 'px';
                    e.style.height = rect.height.toString() + 'px';
                }
                
                function calculateChildRects(rect){
                    var halfWidth = rect.width / 2;
                    var westWidth = Math.floor(halfWidth);
                    var eastWidth = Math.ceil(halfWidth);
                    var halfHeight = rect.height / 2;
                    var northHeight = Math.floor(halfHeight);
                    var southHeight = Math.ceil(halfHeight);
                    var eastLeft = rect.left + westWidth;
                    var southTop = rect.top + northHeight;
                    return {
                        nw: {
                            left: rect.left,
                            top: rect.top,
                            width: westWidth,
                            height: northHeight
                        },
                        ne: {
                            left: eastLeft,
                            top: rect.top,
                            width: eastWidth,
                            height: northHeight
                        },
                        sw: {
                            left: rect.left,
                            top: southTop,
                            width: westWidth,
                            height: southHeight
                        },
                        se: {
                            left: eastLeft,
                            top: southTop,
                            width: eastWidth,
                            height: southHeight
                        }
                    };
                }
                
                function overlap(a, b){
                    return a.left < (b.left + b.width) &&
                    b.left < (a.left + a.width) &&
                    a.top < (b.top + b.height) &&
                    b.top < (a.top + a.height);
                }
                
                function areaOf(rect){
                    return rect.width * rect.height;
                }
                
                // end, helpers
                // -----------------------------------------------------------------
                
                // the root of the tree
                var root = null;
                var quadTreeId = mathworks.util.getNextUniqueId('mathworks_quadtree');
                var could_not_remove = {};
                
                function getNodeClass(){
                    // guard to prevent re-entering invariants() so things don't get out of hand
                    var checkingInvariants = false;
                    
                    // names of child nodes
                    var childNames = {se: 'se', sw: 'sw', ne: 'ne', nw: 'nw'};
                    
                    function Node(parent){
                        this.parent = parent;
                        this.tileLoaded = false;
                        this.tileLoadedUrl = null;
                        this.tileLoading = false;
                        this.tileLoadingUrl = null;
                        this.tileHidden = true;
                        this.clipped = false;
                        this.activeView = false;
                        this.rect = {left: 0, top: 0, width: 0, height: 0};
                        this.childrenHidden = true;
                        this.childrenLoading = false;
                        
                        this.invariants();
                    }
                    
                    Node.prototype = {
                    
                        /*
                         * The following invariants must hold at the point of entry and exit from all Node methods:
                         */
                        invariants: function(f){
                            var that = this;
                            
                            function trueForAllChildren(condition){
                                var actuallyTrueForAllChildren = true;
                                that.forChildren(function(c){
                                    if (!condition(c)) {
                                        actuallyTrueForAllChildren = false;
                                        return true;
                                    }
                                });
                                return actuallyTrueForAllChildren;
                            }
                            
                            if (!checkingInvariants) {
                                checkingInvariants = true;
                                
                                //--------------------------------------------------------------------------
                                // Invariants for childrenHidden
                                
                                mathworks.util.assert(function(){
                                    return !that.parent || !that.parent.childrenHidden || that.childrenHidden;
                                }, "parent.childrenHidden -> childrenHidden");
                                
                                mathworks.util.assert(function(){
                                    return !that.childrenHidden ||
                                    trueForAllChildren( function(c){ return c.childrenHidden; } );
                                }, "childrenHidden -> child.childrenHidden for all children");
                                
                                //--------------------------------------------------------------------------
                                // Invariants for childrenHidden/tileHidden
                                
                                mathworks.util.assert(function(){
                                    return !that.childrenHidden ||
                                    trueForAllChildren( function(c){ return c.tileHidden; } );
                                }, "childrenHidden -> child.tileHidden for all children");
                                
                                mathworks.util.assert(function(){
                                    return !that.parent || !that.parent.childrenHidden || that.tileHidden;
                                }, "parent.childrenHidden -> tileHidden");
                                
                                //--------------------------------------------------------------------------
                                // Invariants for clipped
                                
                                mathworks.util.assert(function(){
                                    return !that.parent || !that.parent.clipped || that.clipped;
                                }, "parent.clipped -> clipped");
                                
                                mathworks.util.assert(function(){
                                    return !that.clipped ||
                                    trueForAllChildren( function(c){ return c.clipped; } );
                                }, "clipped -> child.clipped for all children");
                                
                                //--------------------------------------------------------------------------
                                // Invariants for tileLoading/activeView
                                
                                mathworks.util.assert(function(){
                                    return !that.tileLoading || that.activeView;
                                }, "tileLoading -> activeView");
                                
                                //--------------------------------------------------------------------------
                                // Invariants for activeView
                                mathworks.util.assert(function(){
                                    return !that.activeView ||
                                    ((!that.parent || !that.parent.activeView) &&
                                    trueForAllChildren( function(c){ return !c.activeView; } ) );
                                }, "activeView -> !parent.activeView && !child.activeView for all children");
                                
                                //--------------------------------------------------------------------------
                                // Invariants for tileLoading/childrenLoading
                                
                                mathworks.util.assert(function(){
                                    return !that.parent || !that.tileLoading || that.parent.childrenLoading;
                                }, "tileLoading -> parent.childrenLoading");
                                
                                //--------------------------------------------------------------------------
                                // Invariants for childrenLoading
                                
                                mathworks.util.assert(function(){
                                    return !that.parent || !that.childrenLoading || that.parent.childrenLoading;
                                }, "childrenLoading -> parent.childrenLoading");
                                
                                //--------------------------------------------------------------------------
                                // !tile -> !tileLoading
                                // !tile -> tileHidden
                                
                                mathworks.util.assert(function(){
                                 return that.tile || !that.tileLoading; 
                                 }, "!tile -> !tileLoading");
                                
                                mathworks.util.assert( function(){
                                 return that.tile || that.tileHidden; 
                                 }, "!tile -> tileHidden");
                                
                                checkingInvariants = false;
                            }
                        },
                        
                        forChildren: function(f){
                            var children = this.children;
                            if (children) {
                                for (var childName in childNames) {
                                    if (childNames.hasOwnProperty(childName)) {
                                        var child = children[childName];
                                        if (child && f(child)) {
                                            break;
                                        }
                                    }
                                }
                            }
                        },
                        
                        cancelRequest: function(){
                            this.invariants();
                            if (this.tileLoading) {
                                scheduler.cancelImageRequest(this.tile);
                                this.tileLoading = false;
                                this.invariants();
                            }
                        },
                        
                        cancelAllRequests: function(){
                            this.cancelRequest();
                            if (this.childrenLoading) {
                                this.forChildren( function(c){
                                 c.cancelAllRequests(); 
                                } );
                                this.childrenLoading = false;
                                this.invariants();
                            }
                        },
                        
                        hideTile: function(){
                            this.invariants();
                            if (!this.tileHidden) {
                                this.tile.style.visibility = 'hidden';
                                // bad things happen if we remove an IMG from the DOM after a HTTP
                                //  request has been sent on its behalf - we will remove the IMG from
                                //  the DOM in onTileLoad, once the HTTP request has completed
                                if (!scheduler.hasStartedLoading(this.tile) && this.tile.parentNode) {
                                    this.tile.parentNode.removeChild(this.tile);
                                    if (could_not_remove[this.tile.id]) {
                                        delete could_not_remove[this.tile.id];
                                    }
                                }
                                else {
                                    this.tile.style.display = 'none';
                                    could_not_remove[this.tile.id] = this;
                                }
                                this.tileHidden = true;
                                this.invariants();
                            }
                        },
                        
                        showTile: function(quadTree, behindAll){
                            this.invariants();
                            if (this.tile && this.tileHidden) {
                                this.tile.style.visibility = 'inherit';
                                this.tile.style.display = 'inline';
                                if (could_not_remove[this.tile.id]) {
                                    delete could_not_remove[this.tile.id];
                                }
                                if (behindAll) {
                                    quadTree.insertBefore(this.tile, quadTree.firstChild);
                                }
                                else {
                                    quadTree.appendChild(this.tile);
                                }
                                this.tileHidden = false;
                                // restore invariant: parent.childrenHidden -> tileHidden
                                if (this.parent) {
                                    this.parent.childrenHidden = false;
                                }
                                this.invariants();
                            }
                        },
                        
                        hideChildren: function(){
                            this.invariants();
                            if (!this.childrenHidden) {
                                this.forChildren(function(c){
                                    c.hideAll();
                                });
                                this.childrenHidden = true;
                                this.invariants();
                            }
                        },
                        
                        hideAll: function(){
                            this.hideTile();
                            this.hideChildren();
                        },
                        
                        clip: function(){
                            if (!this.clipped) {
                                this.forChildren(function(c){
                                    c.clip();
                                });
                                this.cancelRequest();
                                this.hideTile();
                                this.childrenLoading = false;
                                this.childrenHidden = true;
                                this.activeView = false;
                                this.clipped = true;
                            }
                        },
                        
                        /**
                         * Attempt to cover the intersection of this.rect and clipRect with any
                         *  available loaded images, recursing if necessary.
                         *
                         * @return true iff images are available to fill the specified region.
                         */
                        showApproximation: function(quadTree, clipRect, maxDepth){
                            var that = this;
                            var completeCoverage;
                            
                            mathworks.util.assert(function(){
                                return overlap(that.rect, clipRect);
                            }, "showApproximation called on clipped node");
                            
                            this.invariants();
                            
                            // show our tile if we have it
                            if (this.tileLoaded) {
                                this.showTile(quadTree);
                                this.hideChildren();
                                completeCoverage = true;
                            }
                            else {
                                // if we have no children, then fail
                                if (!this.children) {
                                    completeCoverage = false;
                                }
                                else {
                                    if (0 === maxDepth) {
                                        this.hideChildren();
                                        completeCoverage = false;
                                    }
                                    else {
                                        // we will need to ensure that our children have the correct size
                                        var childRects = calculateChildRects(this.rect);
                                        var child, childRect;
                                        
                                        completeCoverage = true;
                                        
                                        // loop manually since we need to know if a child is not there
                                        for (var childName in childNames) {
                                            if (childNames.hasOwnProperty(childName)) {
                                                child = this.children[childName];
                                                childRect = childRects[childName];
                                                if (!overlap(childRect, clipRect)) {
                                                    if (child) {
                                                        child.clip();
                                                    }
                                                }
                                                else {
                                                    if (child) {
                                                        child.clipped = false;
                                                        child.resize(childRect);
                                                        if (!child.showApproximation(quadTree, clipRect, maxDepth - 1)) {
                                                            completeCoverage = false;
                                                        }
                                                    }
                                                    else {
                                                        completeCoverage = false;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            // restore invariants
                            if (this.parent) {
                                if (!this.childrenHidden || !this.tileHidden) {
                                    this.parent.childrenHidden = false;
                                }
                            }
                            this.invariants();
                            return completeCoverage;
                        },
                        
                        resize: function(rect){
                            this.invariants();
                            this.rect = rect;
                            if (this.tile) {
                                resizeElement(this.tile, this.rect);
                            }
                            this.invariants();
                        },
                        
                        /**
                         * reveal a portion of this node, possibly calling reveal recursively on
                         *  child nodes.
                         *
                         * @return true iff images are available to fill the specified region.
                         */
                        reveal: function(quadTree, clipRect){
                            var that = this;
                            var completeCoverage;
                            
                            function clearActiveView(node){
                                if (!node.activeView) {
                                    node.forChildren(function(c){
                                        clearActiveView(c);
                                    });
                                }
                                node.activeView = false;
                            }
                            
                            this.invariants();
                            
                            // check to see if any of this node is visible
                            if (!overlap(this.rect, clipRect)) {
                                this.clip();
                                this.invariants();
                                return true;
                            }
                            
                            this.clipped = false;
                            
                            // check to see if we need to subdivide at this level
                            if (areaOf(this.rect) > maxTileSize) {
                                this.cancelRequest();
                                
                                this.activeView = false;
                                
                                // while not necessarily true, falsifying this does not violate an invariant,
                                //  and will most likely reflect reality
                                this.childrenHidden = false;
                                
                                // lazily create children to keep memory footprint from going crazy
                                if (!this.children) {
                                    this.children = {};
                                }
                                
                                // assume true, let children tell us otherwise
                                completeCoverage = true;
                                
                                // recurse on inner children
                                var childRects = calculateChildRects(this.rect);
                                var child;
                                for (var childName in childNames) {
                                    if (childNames.hasOwnProperty(childName)) {
                                        child = this.children[childName];
                                        if (!child) {
                                            child = this.children[childName] = new Node(this);
                                        }
                                        child.resize(childRects[childName]);
                                    }
                                }
                                for (var childName in childNames) {
                                    if (childNames.hasOwnProperty(childName)) {
                                        child = this.children[childName];
                                        if (!child.reveal(quadTree, clipRect)) {
                                            completeCoverage = false;
                                        }
                                    }
                                }
                                
                                if (this.childrenLoading && this.parent) {
                                    this.parent.childrenLoading = true;
                                }
                                
                                if (!completeCoverage && this.tileLoaded) {
                                    this.showTile(quadTree, true);
                                    completeCoverage = true;
                                }
                                else {
                                    this.hideTile();
                                }
                            }
                            else {
                                this.forChildren(function(c){
                                    c.cancelAllRequests();
                                });
                                
                                if (!this.activeView) {
                                    this.activeView = true;
                                    this.forChildren(function(c){
                                        clearActiveView(c);
                                    });
                                }
                                
                                // get the service request url
                                var url = getQuadTreeTileURL({
									width : root.rect.width,
									height : root.rect.height,
                                	cropLeft : this.rect.left,
                                    cropTop : this.rect.top,
                                    cropRight : root.rect.width - (this.rect.left + this.rect.width),
                                	cropBottom : root.rect.height - (this.rect.top + this.rect.height)
								}); 
                                
                                if (this.tileLoaded && this.tileLoadedUrl === url) {
                                    // we are up to date; hurrah!
                                    this.showTile(quadTree);
                                    this.hideChildren();
                                    completeCoverage = true;
                                }
                                else {
                                    // show a temporary approximation of the current view if possible
                                    completeCoverage = this.showApproximation(quadTree, clipRect, 3);
                                    
                                    if (!this.tileLoading || this.tileLoadingUrl !== url) {
                                        if (!this.tile) {
                                            this.tile = document.createElement('img');
                                            this.tile.id = mathworks.util.getNextUniqueId(quadTreeId + '_tile');
                                            this.tile.style.position = 'absolute';
                                            this.tile.style.visibility = 'hidden';
                                            resizeElement(this.tile, this.rect);
                                        }
                                        scheduler.loadImage(this.tile, url, function(){ that.onTileLoad(quadTree); } );
                                        this.tileLoading = true;
                                        this.tileLoadingUrl = url;
                                    }
                                }
                            }
                            
                            // restore invariants
                            if (this.parent) {
                                if (this.tileLoading || this.childrenLoading) {
                                    this.parent.childrenLoading = true;
                                }
                                if (!this.tileHidden || !this.childrenHidden) {
                                    this.parent.childrenHidden = false;
                                }
                            }
                            
                            this.invariants();
                            
                            return completeCoverage;
                        },
                        
                        isLoaded: function(){
                            if (this.tileLoaded || this.clipped) {
                                return true;
                            }
                            
                            if (this.children) {
                                var allChildrenLoaded = true;
                                this.forChildren(function(c){
                                    if (!c.isLoaded()) {
                                        allChildrenLoaded = false;
                                        return true;
                                    }
                                });
                                return allChildrenLoaded;
                            }
                            else {
                                return false;
                            }
                        },
                        
                        tryToRemoveIfHidden: function(){
                            if (this.tileHidden && this.tile && this.tile.parentNode) {
                                if (!scheduler.hasStartedLoading(this.tile)) {
                                    this.tile.parentNode.removeChild(this.tile);
                                    if (could_not_remove[this.tile.id]) {
                                        delete could_not_remove[this.tile.id];
                                    }
                                }
                            }
                        },
                        
                        onTileLoad: function(quadTree){
                            this.invariants();
                            
                            var rootWasLoaded = root.isLoaded();
                            
                            this.tileLoaded = true;
                            this.tileLoadedUrl = this.tileLoadingUrl;
                            this.tileLoading = false;
                            this.tileLoadingUrl = null;
                            
                            if (this.activeView) {
                                this.showTile(quadTree);
                                this.hideChildren();
                                for (var p = this.parent; p; p = p.parent) {
                                    p.childrenHidden = false;
                                }
                            }
                            
                            if (!rootWasLoaded && root.isLoaded()) {
                                if (quadTree.notifyLoaded) {
                                    quadTree.notifyLoaded();
                                }
                            }
                            
                            this.tryToRemoveIfHidden();
                            this.invariants();
                        }
                    };
                    
                    // disable invariant checking
                    Node.prototype.invariants = function(){};
                    
                    return Node;
                };
                
                // hide the creation of the tree DIV inside a function so that the tree (which is a DOM element)
                //  will not be implicitly referenced from the Node constructor and its methods.  This is to
                //  guard against reference loops between Node objects and the tree DIV object.
                function newQuadTree(QuadTreeNode){
                    var tree = document.createElement('div');
                    tree.id = quadTreeId;
                    
                    root = new QuadTreeNode();
                    
                    tree.resize = function(w, h){
                        root.resize({ left: 0, top: 0, width: w, height: h });
                    };
                    
                    tree.reveal = function(clipRect){
                        var rootRect = { left: 0, top: 0,
                            width: parseInt(this.style.width, 10),
                            height: parseInt(this.style.height, 10)
                        };
                        root.clipRect = clipRect;
                        root.resize(rootRect);
                        root.reveal(this, clipRect);
                        for (var tile_id in could_not_remove) {
                            if (could_not_remove.hasOwnProperty(tile_id)) {
                                var node = could_not_remove[tile_id];
                                node.tryToRemoveIfHidden();
                            }
                        }
                    };
                    
                    tree.notifyHiding = function(){
                        this.cancelAllRequests();
                    };
                    
                    tree.cancelAllRequests = function(){
                        root.cancelAllRequests();
                    };
                    
                    return tree;
                }
                
                return newQuadTree(getNodeClass());
            }
            
            return createQuadTree;
        }();
    }
});


