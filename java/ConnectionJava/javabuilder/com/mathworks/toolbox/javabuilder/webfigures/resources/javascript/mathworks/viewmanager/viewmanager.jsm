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
	
    name: "mathworks/viewmanager/viewmanager.jsm",
    
    requires: "mathworks/util/idmanager.jsm",
    
    definition: function(context){
    
        if (!mathworks.viewmanager) {
            mathworks.viewmanager = {};
        }
        
        mathworks.viewmanager.ViewManager = function(){
            function ViewManager(containerElement){
                var viewportRect = { left: 0, top: 0, width: 0, height: 0 };
                var viewportElement = document.createElement('div');
                var viewContainerParent = document.createElement('div');
                var viewContainerMap = {};
                var activeView = null;
                
                viewportElement.id = mathworks.util.getNextUniqueId('mathworks_ViewManager_viewportElement');
                viewportElement.style.position = 'absolute';
                viewportElement.style.display = 'none';
                viewportElement.style.overflow = 'hidden';
                containerElement.appendChild(viewportElement);
                
                viewContainerParent.id = mathworks.util.getNextUniqueId('mathworks_ViewManager_viewContainerParent');
                viewContainerParent.style.position = 'absolute';
                viewContainerParent.style.left = '0px';
                viewContainerParent.style.top = '0px';
                viewContainerParent.style.width = '100%';
                viewContainerParent.style.height = '100%';
                viewportElement.appendChild(viewContainerParent);
                
                this.viewWidth = 0;
                this.viewHeight = 0;
                this.viewOffsetX = 0; // offset from horizontal center
                this.viewOffsetY = 0; // offset from vertical center
                
                this.revealElement = function(element){
                    // set positioning type
                    element.style.position = 'absolute';
                    
                    // set left/top
                    var x = (viewportRect.width - this.viewWidth) / 2 + this.viewOffsetX;
                    var y = (viewportRect.height - this.viewHeight) / 2 + this.viewOffsetY;
                    element.style.left = Math.floor(x).toString() + 'px';
                    element.style.top = Math.floor(y).toString() + 'px';
                    
                    // set size
                    var sizeChanged = false;
                    if (parseInt(this.viewWidth, 10) !== parseInt(element.style.width, 10)) {
                        element.style.width = Math.floor(this.viewWidth).toString() + 'px';
                        sizeChanged = true;
                    }
                    if (parseInt(this.viewHeight, 10) !== parseInt(element.style.height, 10)) {
                        element.style.height = Math.floor(this.viewHeight).toString() + 'px';
                        sizeChanged = true;
                    }
                    
                    // send resize event (if necessary)
                    if (sizeChanged) {
                        element.resize(Math.floor(this.viewWidth), Math.floor(this.viewHeight));
                    }
                    
                    // send reveal event
                    element.reveal({
                        left: Math.floor(-x),
                        top: Math.floor(-y),
                        width: Math.floor(viewportRect.width),
                        height: Math.floor(viewportRect.height)
                    });
                };
                
                this.refresh = function(){
                    if (!activeView) {
                        return;
                    }
                    var element = activeView.firstChild;
                    this.revealElement(element);
                };
                
                // TODO - refactor this arglist as objects
                this.setViewportRect = function(rect){
                    viewportRect = rect;
                    viewportElement.style.left = parseInt(rect.left, 10).toString() + 'px';
                    viewportElement.style.top = parseInt(rect.top, 10).toString() + 'px';
                    viewportElement.style.width = parseInt(rect.width, 10).toString() + 'px';
                    viewportElement.style.height = parseInt(rect.height, 10).toString() + 'px';
                    this.refresh();
                };
                
                this.getViewportRect = function(){
                    return viewportRect;
                };
                
                // TODO - refactor this arglist as objects
                this.setViewSize = function(w, h){
                    this.viewWidth = w;
                    this.viewHeight = h;
                    this.refresh();
                };
                
                // TODO - refactor this arglist as objects
                this.setViewOffset = function(x, y){
                    this.viewOffsetX = x;
                    this.viewOffsetY = y;
                    this.refresh();
                };
                
                this.setBackgroundColor = function(color){
                    viewportElement.style.backgroundColor = color;
                    this.refresh();
                };
                
                this.addView = function(id, element, forceReveal){
                    if (element) {
                        var viewContainer = document.createElement('div');
                        viewContainer.id = mathworks.util.getNextUniqueId('mathworks_ViewManager_viewContainer_' + id + '_');
                        viewContainer.viewId = id;
                        viewContainer.style.visibility = 'hidden';
                        viewContainer.appendChild(element);
                        viewContainerParent.appendChild(viewContainer);
                        viewContainerMap[id] = viewContainer;
                        if (forceReveal) {
                            this.revealElement(element);
                        }
                    }
                };
                
                this.getView = function(id){
                    return viewContainerMap[id];
                };
                
                this.hasView = function(id){
                    return this.getView(id) ? true : false;
                };
                
                this.setActiveView = function(id){
                    if (activeView) {
                        activeView.style.visibility = 'hidden';
                        if (activeView.firstChild.notifyHiding) {
                            activeView.firstChild.notifyHiding();
                        }
                    }
                    activeView = this.getView(id);
                    if (activeView) {
                        activeView.style.visibility = 'inherit';
                        this.refresh();
                    }
                };
                
                this.show = function(){
                    viewportElement.style.display = 'block';
                    this.refresh();
                };
                
                this.hide = function(){
                    viewportElement.style.display = 'none';
                    this.refresh();
                };
            }
            
            return ViewManager;
        }();
    }
});
