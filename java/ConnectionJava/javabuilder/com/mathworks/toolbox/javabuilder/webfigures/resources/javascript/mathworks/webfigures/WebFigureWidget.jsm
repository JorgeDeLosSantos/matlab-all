// Embeddable WebFigure widget 

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
	
    name: "mathworks/webfigures/WebFigureWidget.jsm",
    
    requires: ["mathworks/loadscheduler/loadscheduler.jsm", 
			   "mathworks/viewmanager/viewmanager.jsm", 
			   "mathworks/cube3d/cube3d.jsm", 
			   "mathworks/mousewheel/mousewheel.jsm",
			   "mathworks/quadtree/quadtree.jsm",
			   "mathworks/util/DOMUtils.jsm",
			   "mathworks/webfigures/toolbar.jsm"],
    
    definition: function(context){
        
        if (!mathworks.webfigures) {
            mathworks.webfigures = {};
        }
		
		var moduleDir = this.name.substring(0,this.name.lastIndexOf('/'));
        
        mathworks.webfigures.WebFigureWidget = function(){
            
            function makeViewElementCallbackDetacher(viewElement){
                return function(){
                    viewElement.resize = null;
                    viewElement.reveal = null;
                    viewElement.notifyLoaded = null;
                    viewElement.notifyHiding = null;
                    viewElement.cancelAllRequests = null;
                    viewElement.detachCallbacks = null;
                };
            }
            
            function WebFigureView(figure, scheduler){                
                var container = mathworks.DOMUtils.makeElement('div', {
                    id: 'mathworks_WebFigureView_container',
                    style: {
                        position: 'relative',
                        width: '100%',
                        height: '100%',
                        padding: '0px',
                        margin: '0px'
                    }
                });
                
                this.container = container;
                
                var viewManager = new mathworks.viewmanager.ViewManager(container);
                var cube = new mathworks.cube3d.Cube3D(container); // Must be after viewManager to appear on top    
                var currentAzimuth = 65;
                var currentElevation = 30;
                var currentlyLoadingView = null;
                var currentlyLoadingViewId = null;
                var cubeTimeoutId = 0;
                var MIN_WIDTH = 120;
                var MIN_HEIGHT = 90;
                var MAX_PIXELS = parseFloat('48000000000000'); // the renderer does strange things beyond this point        

                function getEffectiveAzimuth(){
                    // round to nearest 10 degrees
                    var effectiveAzimuth = (currentAzimuth + 5) - ((currentAzimuth + 5) % 10);
                    if (effectiveAzimuth === 360) {
                        effectiveAzimuth = 0;
                    }
                    return effectiveAzimuth;
                }
                
                function getEffectiveElevation(){
                    // round to nearest 10 degrees
                    var effectiveElevation;
                    if (currentElevation < 0) {
                        effectiveElevation = (-currentElevation) + 5;
                        effectiveElevation = effectiveElevation - (effectiveElevation % 10);
                        effectiveElevation = -effectiveElevation;
                    } else {
                        effectiveElevation = (currentElevation + 5) - ((currentElevation + 5) % 10);
                    }
                    return effectiveElevation;
                }
                
                function getCurrentViewId(){
                    return "angle_" + getEffectiveAzimuth() + "_" + (getEffectiveElevation() + 90);
                }
                
                this.setViewAngle = function(az, el){
                    currentAzimuth = az;
                    currentElevation = el;
                    if (currentElevation > 90) {
                        currentElevation = 90;
                    }
                    if (currentElevation < -90) {
                        currentElevation = -90;
                    }
                    while (currentAzimuth < 0) {
                        currentAzimuth += 360;
                    }
                    currentAzimuth = currentAzimuth % 360;
                    // keep the cube up-to-date wrt current camera angle even if it is hidden
                    cube.setAngle(-getEffectiveAzimuth(), getEffectiveElevation());
                    this.refresh();
                };
                
                this.zoom = function(delta_size){
                    var h = viewManager.viewHeight;
                    var w = viewManager.viewWidth;
                    var dh = (delta_size * h) / 120; // TBD - what is this magic 120?  a scaling factor?
                    var dw = (w * (h + dh)) / h - w;
                    if (((h + dh) > MIN_HEIGHT && (w + dw) > MIN_WIDTH) && ((h + dh) * (w + dw) < MAX_PIXELS)) {
                        viewManager.setViewOffset((viewManager.viewOffsetX * (dw + w)) / w, 
                                                  (viewManager.viewOffsetY * (dh + h)) / h);
                        viewManager.setViewSize(w + dw, h + dh);
                        return true;
                    }
                    else {
                        return false;
                    }
                };
                
                this.pan = function(dx, dy){
                    viewManager.setViewOffset(viewManager.viewOffsetX + dx, viewManager.viewOffsetY + dy);
                };
                
                this.rotate = function(delta_az, delta_el){
                    this.setViewAngle(currentAzimuth + delta_az, currentElevation + delta_el);
                };
                
                this.setBackgroundColor = function(color){
                    container.style.backgroundColor = color;
                    this.refresh();
                };
                
                this.show = function(){
                    viewManager.show();
                    this.refresh();
                };
                
                this.hide = function(){
                    viewManager.hide();
                };
                
                this.getPan = function(){
                    return {
                        left: viewManager.viewOffsetX,
                        top: viewManager.viewOffsetY
                    };
                };
                
                this.setPan = function(p){
                    viewManager.setViewOffset(p.left, p.top);
                    this.refresh();
                };
                
                this.getZoom = function(){
                    return {
                        width: viewManager.viewWidth,
                        height: viewManager.viewHeight
                    };
                };
                
                this.setZoom = function(z){
                    viewManager.setViewSize(z.width, z.height);
                    cube.setAspectRatio(z.width, z.height);
                    this.refresh();
                };
                
                this.setViewportSize = function(viewportRect){
                    viewManager.setViewportRect({ left: 0, top: 0, width: viewportRect.width, height: viewportRect.height });
                    var cubeSize = viewportRect.width / 4;
                    if (cubeSize < 64) {
                        cubeSize = 64;
                    }
                    cube.setSize(cubeSize);
                    cube.setPosition(viewportRect.width / 2, viewportRect.height / 2);
                    this.refresh();
                };
                
                this.getViewportSize = function(){
                    var rect = viewManager.getViewportRect();
                    return { width: rect.width, height: rect.height };
                };
                
                this.refresh = function(){
                    if (0 === viewManager.viewWidth || 0 === viewManager.viewHeight) {
                        // prevent sending requests to the server for zero-sized images
                        return;
                    }
                    
                    var viewId = getCurrentViewId();
                    
                    // if this view has already been cached, simply display it 
                    //  (the viewManager will give the view element a chance to request
                    //  images at the proper resolution via the 'reveal' method)
                    if (viewManager.hasView(viewId)) {
                        viewManager.setActiveView(viewId);
                        clearTimeout(cubeTimeoutId);
                        cubeTimeoutId = setTimeout(function(){
                            cube.hide();
                        }, 250);
                    }
                    else {
                        // if the new view is being loaded in response to user input, show the cube
                        clearTimeout(cubeTimeoutId);
                        cube.show();
                        
                        // set up view parameters for the render operation
						var rotation = getEffectiveAzimuth();
                        var elevation = getEffectiveElevation();
                        
                        // show the cube immediately by releasing the JavaScript thread momentarily
                        setTimeout(function(){
                            if (getCurrentViewId() === viewId) {
                                // if there is another view in progress, cancel it now
                                if (currentlyLoadingView) {
                                    if (currentlyLoadingViewId === viewId) {
                                        return;
                                    }
                                    currentlyLoadingView.cancelAllRequests();
                                    mathworks.util.detachEventHandler(window, 'unload', currentlyLoadingView.detachCallbacks);
                                    currentlyLoadingView.detachCallbacks();
                                    currentlyLoadingView = null;
                                }
                                
                                // create a new view element for the given camera angle

								var getQuadTreeTileURL = function (params) {
									return figure.getImageURL({
										width : params.width,
										height : params.height,
										cropLeft : params.cropLeft,
										cropRight : params.cropRight,
										cropTop : params.cropTop,
										cropBottom : params.cropBottom,
										elevation : elevation,
										rotation : rotation
									});
								};
								
                                var viewElement = mathworks.quadtree.create(getQuadTreeTileURL, 512 * 512, scheduler);
								
                                viewElement.notifyLoaded = function(){
                                    mathworks.util.detachEventHandler(window, 'unload', viewElement.detachCallbacks);
                                    viewElement.notifyLoaded = null;
                                    viewElement.detachCallbacks = null;
                                    if (currentlyLoadingView === viewElement) {
                                        currentlyLoadingView = null;
                                        currentlyLoadingViewId = null;
                                    }
                                    delete mathworks.webfigures.pendingViews[viewId];
                                    viewElement.style.visibility = 'inherit';
                                    viewManager.addView(viewId, viewElement);
                                    if (viewId === getCurrentViewId()) {
                                        viewManager.setActiveView(viewId);
                                        clearTimeout(cubeTimeoutId);
                                        cubeTimeoutId = setTimeout(function(){
                                            cube.hide();
                                        }, 150);
                                    }
                                };
                                
                                viewElement.detachCallbacks = makeViewElementCallbackDetacher(viewElement);
                                mathworks.util.attachEventHandler(window, 'unload', viewElement.detachCallbacks);
                                
                                if (!mathworks.webfigures.pendingViews) {
                                    mathworks.webfigures.pendingViews = {};
                                }
                                mathworks.webfigures.pendingViews[viewId] = viewElement;
                                
                                viewElement.style.visibility = 'hidden';
                                container.appendChild(viewElement);
                                
                                // the newly created view element is the currently loading one.
                                currentlyLoadingView = viewElement;
                                currentlyLoadingViewId = viewId;
                                
                                // start the image tiles loading
                                viewManager.revealElement(viewElement);
                            }
                        }, 0);
                    }
                };
				
				// request WebFigure properties 
				var initParams = figure.getProperties();
				this.setViewAngle(initParams.azimuth, initParams.elevation);
				this.setBackgroundColor(initParams.backgroundcolor);
                
                return this;
            }
            
            function WebFigureController(figure, scheduler){
                //----------------------------------------------------------------------
                // private data
                //----------------------------------------------------------------------                                              
                var userSpecifiedZoom = false;
                var restorePreviousZoom = false;
                var previousZoom = null;
                var previousPan = null;
                var dragging = false;
                var startX;
                var startY;
                var navMode;                
                
                var view = new WebFigureView(figure, scheduler);
                this.view = view;
                var btnSize = "28px";                  
                
                var toolbar = mathworks.webfigures.toolbar({
			            
                            "orientation" : "horizontal",
			                
                            "id"          : "mathworks_WebFigureWidget_toolbar",
			                
                            "style"       : { "visibility"       : "hidden",
                                              "backgroundImage"  : "url(" + context.loader.getResource(moduleDir + '/images/toolbarGradient.png') + ")",
                                              "backgroundRepeat" : "repeat-x",
                                              "opacity"          : "0",
                                              "filter"           : "alpha(opacity=0)",
                                              "width"            : "100%",
                                              "height"           : btnSize }, 
			                                  
                            "buttons"     : [{"id"             : "sizeToFit",
                                              "viewIcon"       : context.loader.getResource(moduleDir + '/images/Maximize_Up.png'),                                              
                                              "title"          : "Size to fit",
                                              "style"          : { cssFloat:'right', styleFloat:'right', width:btnSize, height:btnSize },
                                              "events"         : {
                                                   click: function(event, buttonView, buttonEventSink){
                                                       setUserSpecifiedZoom(!userSpecifiedZoom);                                                       
                                                   },
                                                                
                                                   mousedown: function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.setCapture) {
                                                           buttonEventSink.setCapture();
                                                       }                                                        
                                                   },
                                                                
                                                   mouseup: function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.releaseCapture) {
                                                           buttonEventSink.releaseCapture();
                                                       }                                                       
                                                   },
                                                                
                                                   mouseover : function(event, buttonView, buttonEventSink){
                                                                    
                                                       if(userSpecifiedZoom){
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/Minimize_Over.png');
                                                       }
                                                       else{
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/Maximize_Over.png');
                                                       }
                                                   },
                                                                
                                                   mouseout : function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.releaseCapture) {
                                                           buttonEventSink.releaseCapture();
                                                       }
                                                       if(userSpecifiedZoom){
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/Minimize_Up.png');
                                                       }
                                                       else{
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/Maximize_Up.png');
                                                       }
                                                   }
                                                }// End events
                                              },
                                              {"id"             : "zoomMode",
                                               "viewIcon"       : context.loader.getResource(moduleDir + '/images/zoomMode_Up.png'),                                              
                                               "title"          : "Zoom",
                                               "style"          : { width:btnSize, height:btnSize },
                                               "events"         : {
                                                   mousedown: function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.setCapture) {
                                                           buttonEventSink.setCapture();
                                                       }                                                       
                                                       setNavMode('zoom', navMode);
                                                   },
                                                   
                                                   mouseup: function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.releaseCapture) {
                                                           buttonEventSink.releaseCapture();
                                                       }                                                       
                                                   },
                                                                
                                                   mouseover : function(event, buttonView, buttonEventSink){

                                                       if(navMode==='zoom'){
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/zoomMode_Down_Over.png');
                                                       }
                                                       else{
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/zoomMode_Over.png');
                                                       }
                                                   },
                                                                
                                                   mouseout : function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.releaseCapture) {
                                                           buttonEventSink.releaseCapture();
                                                       }
                                                       if(navMode==='zoom'){
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/zoomMode_Down.png');
                                                       }
                                                       else{
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/zoomMode_Up.png');
                                                       }
                                                   }
			                                    }//End events
			                                  },
                                              {"id"             : "panMode",
                                               "viewIcon"       : context.loader.getResource(moduleDir + '/images/panMode_Up.png'),                                               
                                               "title"          : "Pan",
                                               "style"          : { width:btnSize, height:btnSize },
                                               "events"         : {
                                                   mousedown: function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.setCapture) {
                                                           buttonEventSink.setCapture();
                                                       }
                                                       setNavMode('pan', navMode);
                                                   }, 
                                                                
                                                   mouseup: function(event, buttonView, buttonEventSink){                                                       
                                                       if (buttonEventSink.releaseCapture) {
                                                           buttonEventSink.releaseCapture();
                                                       }                                                       
                                                   },
                                                                
                                                   mouseover : function(event, buttonView, buttonEventSink){

                                                       if(navMode==='pan'){
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/panMode_Down_Over.png');
                                                       }
                                                       else{
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/panMode_Over.png');
                                                       }
                                                   },
                                                                
                                                   mouseout : function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.releaseCapture) {
                                                           buttonEventSink.releaseCapture();
                                                       }
                                                       if(navMode==='pan'){
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/panMode_Down.png');
                                                       }
                                                       else{
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/panMode_Up.png');
                                                       }
                                                   }
                                                }//End events
                                              },
                                              {"id"             : "rotateMode",
                                               "viewIcon"       : context.loader.getResource(moduleDir + '/images/rotateMode_Up.png'),                                                
                                               "title"          : "Rotate",
                                               "style"          : { width:btnSize, height:btnSize },
                                               "events"         : {
                                                   mousedown: function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.setCapture) {
                                                           buttonEventSink.setCapture();
                                                       }                                                       
                                                       setNavMode('rotate', navMode);
                                                   },
                                                                
                                                   mouseup: function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.releaseCapture) {
                                                           buttonEventSink.releaseCapture();
                                                       }                                                       
                                                   },
                                                                
                                                   mouseover : function(event, buttonView, buttonEventSink){

                                                       if(navMode==='rotate'){
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/rotateMode_Down_Over.png');
                                                       }
                                                       else{
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/rotateMode_Over.png');
                                                       }
                                                   },
                                                                
                                                   mouseout : function(event, buttonView, buttonEventSink){
                                                       if (buttonEventSink.releaseCapture) {
                                                           buttonEventSink.releaseCapture();
                                                       }
                                                       if(navMode==='rotate'){
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/rotateMode_Down.png');
                                                       }
                                                       else{
                                                           buttonView.src = context.loader.getResource(moduleDir + '/images/rotateMode_Up.png');
                                                       }
                                                   }
                                                }//End events
                                              }] //End button array
                }); // End mathworks.webfigures.toolbar
                
                this.toolbar = toolbar;                
                
                //----------------------------------------------------------------------
                // canvas event helper functions
                //----------------------------------------------------------------------
                
                function startDragging(updateX, updateY){                    
                    dragging = true;
                    startX = updateX;
                    startY = updateY;
                }
                
                function dragMouse(updateX, updateY){
                    if (dragging) {
                        var dx = (updateX - startX);
                        var dy = (updateY - startY);
                        
                        startX = updateX;
                        startY = updateY;
                        
                        if (navMode === 'rotate') {
                            view.rotate(-dx / 2, dy / 2);
                        }
                        else if (navMode === 'zoom') {
                                if (view.zoom(-dy * 3)) {
                                    restorePreviousZoom = false;
                                }
                                setUserSpecifiedZoom(true);
                            }
                            else if (navMode === 'pan') {
                                    restorePreviousZoom = false;
                                    setUserSpecifiedZoom(true);
                                    view.pan(dx, dy);
                                }
                    }
                }
                
                function stopDragging(){
                    dragging = false;
                }
                
                //----------------------------------------------------------------------
                // toolbar button event helper functions
                //----------------------------------------------------------------------
                
                function setNavMode(newMode, currentMode){                    
                    if(newMode!==currentMode){
                        var currentModeButton = toolbar.view[currentMode + 'Mode'];
                        var newModeButton     = toolbar.view[newMode + 'Mode']; 
                        
                        if(currentModeButton){                            
                            currentModeButton.src = context.loader.getResource(moduleDir + '/images/' + currentMode + 'Mode_Up.png');                              
                        }
                        
                        if(newModeButton){                            
                            newModeButton.src = context.loader.getResource(moduleDir + '/images/' + newMode + 'Mode_Down.png');    
                        }
                        navMode = newMode;                        
                    }
                }
                
                function setUserSpecifiedZoom(on){
                    if (on) {
                        userSpecifiedZoom = true;                        
                        toolbar.view['sizeToFit'].src = context.loader.getResource(moduleDir + '/images/Minimize_Up.png');
                    } else {
                        userSpecifiedZoom = false;                                                
                        toolbar.view['sizeToFit'].src = context.loader.getResource(moduleDir + '/images/Maximize_Up.png');    
                                                                   
                        restorePreviousZoom = true;
                        previousZoom = view.getZoom();
                        previousPan = view.getPan();
                    }
                    if (on && restorePreviousZoom) {
                        view.setZoom(previousZoom);
                        view.setPan(previousPan);
                    } 
                    else if (!userSpecifiedZoom) {
                            view.setZoom(view.getViewportSize());
                            view.setPan({ left: 0, top: 0 });
                        }
                }
                
                //----------------------------------------------------------------------
                // canvas event handler functions
                //----------------------------------------------------------------------
                
                var canvasEventHandlers = (function(){
                    var mouseIsDown = false;
                    var mouseIsOver = false;  
                    
                    return {
                        mousedown: function(event, eventCanvas){                                                        
                            mouseIsDown = true;
                            startDragging(event.clientX, event.clientY);                        
                            
                            if ( eventCanvas.setCapture) {
                                eventCanvas.setCapture();
                            }                                                       
                        },
                        dblclick: function(event, eventCanvas){
                            setUserSpecifiedZoom(!userSpecifiedZoom);
                        },
                        mouseup: function(event, eventCanvas){                            
                            mouseIsDown = false;
                            stopDragging();                                                                                    
                            if (eventCanvas.releaseCapture) {
                                eventCanvas.releaseCapture();
                                if (!mouseIsOver) {
                                    toolbar.hide();
                                }                                                                                                
                            }                            
                        },
                        mouseover: function(event, eventCanvas){
                            // The fromElement/toElement check is for IE only. Due to 
                            // setCapture, mouseover gets invoked when the mouse leaves
                            // webfigure. This mouseover is for the BODY but due to setCapture
                            // gets routed here. We don't want to do anything in this case.
                            // (event.fromElement === event.toElement) is an undocumented 
                            // behavior 
                            if((event.fromElement && event.toElement) &&       
                               (event.fromElement === event.toElement)){ 
                                    return;
                            }                                                            
                            mouseIsOver = true;                                                       
                        },
                        mouseout: function(event, eventCanvas){ 
                            // In this case, the extra mouseout call is when mouse leaves
                            // BODY and gets on the webfigure
                            if((event.fromElement && event.toElement) &&       
                               (event.fromElement === event.toElement)){ 
                                    return;
                            }                                                 
                            mouseIsOver = false;                        
                            if (!eventCanvas.releaseCapture) {
                                mouseIsDown = false;
                                stopDragging();                            
                            }                            
                        },
                        mousemove: function(event, eventCanvas){
                            if (!mouseIsDown) {
                                mouseIsOver = true;
                            }                         
                            dragMouse(event.clientX, event.clientY);                            
                        }
                    };
                })();
                
                //----------------------------------------------------------------------
                // public methods
                //----------------------------------------------------------------------                
                
                this.canvasEvent = function(eventType, eventObject, eventCanvas){
                    if (eventType in canvasEventHandlers) {
                        return canvasEventHandlers[eventType](eventObject, eventCanvas);
                    }
                };
                
                this.resizeEvent = function(w, h){
                    var containerWidth = view.container.offsetWidth;
                    var containerHeight = view.container.offsetHeight;
                    view.setViewportSize({ width: containerWidth, height: containerHeight });
                    if (!userSpecifiedZoom) {
                        view.setPan({ left: 0, top: 0 });
                        view.setZoom({ width: containerWidth, height: containerHeight });
                    }
                };
                
                this.mouseWheelEvent = function(delta){
                    if (view.zoom(delta * 32)) {
                        restorePreviousZoom = false;
                    }
                    setUserSpecifiedZoom(true);
                };

                // Now that we have removed the layers and use only the icon layer, we first create the toolbar
                // which requests the default images for the up position for all the buttons. If the following
                // call is made outside the timer as before, we end up with 2 src calls for the same IMG even
                // before it is confined to the document, which happens when the toolbar is appended to the
                // container. As a result, as can be seen in firefox, we see an incomplete GET request for the
                // rotateMode_Up.png. The rotateMode_Down.png GET request completes successfully. To avoid this,
                // we will be setting the navMode in this timer which will be launched after the constructor of
                // WebFigureWidget returns which automatically launches it after the toolbar is appended to the
                // container.
                setTimeout( function(){
                    setNavMode('rotate','');
                }, 0 );
                setUserSpecifiedZoom(false);
                
                // work-around for clicking size-to-fit button for the first time 
                restorePreviousZoom = false;				
				
				view.show();
				                
                return this;
            }
            
            function makeCanvasEventHandler(controller, eventType){
                return function(e){
                    var event = e || window.event;
                    controller.canvasEvent(eventType, event, this);
                };
            }
            
            function makeEventCanvas(controller){
                var eventCanvas = document.createElement('div');
                eventCanvas.id = mathworks.util.getNextUniqueId('mathworks_WebFigureWidget_eventCanvas');
                eventCanvas.style.position = 'absolute';
                eventCanvas.style.left = '0px';
                eventCanvas.style.top = '0px';
                eventCanvas.style.width = '100%';
                eventCanvas.style.height = '100%';
				eventCanvas.style.backgroundImage = 'url(' + context.loader.getResource(moduleDir + '/images/transparent_pixel.gif') + ')';
                eventCanvas.onmousedown = makeCanvasEventHandler(controller, 'mousedown');
                eventCanvas.onmouseup = makeCanvasEventHandler(controller, 'mouseup');
                eventCanvas.onmouseover = makeCanvasEventHandler(controller, 'mouseover');
                eventCanvas.onmouseout = makeCanvasEventHandler(controller, 'mouseout');
                eventCanvas.onmousemove = makeCanvasEventHandler(controller, 'mousemove');
                eventCanvas.ondblclick = makeCanvasEventHandler(controller, 'dblclick');
                return eventCanvas;
            }
            
            function makeResizeHandler(controller){
                return function(e){
                    var event = e || window.event;
                    var element = event.target || event.srcElement;
                    controller.resizeEvent(element.offsetWidth, element.offsetHeight);
                };
            }
            
            function makeMouseWheelHandler(controller){
                return function(delta){
                    return controller.mouseWheelEvent(delta);
                };
            }
            
            function makeSchedulerStatus(scheduler){
                var schedulerStatus = document.createElement('div');
                schedulerStatus.displayed = false;
                schedulerStatus.position = 'absolute';
                schedulerStatus.style.left = '0px';
                schedulerStatus.style.top = '0px';
                schedulerStatus.style.width = '128px';
                schedulerStatus.style.border = '1px solid black';
                schedulerStatus.style.display = 'none';
                schedulerStatus.style.backgroundColor = 'white';
                
                // display the scheduler status box
                schedulerStatus.displayed = true;
                schedulerStatus.style.display = 'block';
                scheduler.onchange = function(){
                    schedulerStatus.innerHTML = 
                            'Queued: '      + this.queue.length     + '<br>' +
                            'Started: '     + this.numStarted       + '<br>' +
                            'Cancelled: '   + this.numCancelled     + '<br>' +
                            'TimedOut: '    + this.numFailed        + '<br>' +
                            'Overrides: '   + this.requestOverrides;
                };
                scheduler.onchange();
                
                return schedulerStatus;
            }
            
            function focusHolderOnBlur(){
                var eventCanvas = this.parentNode;
                mathworks.mousewheel.clearMouseWheelEventHandler(eventCanvas, eventCanvas.wheelHandler);
            }
            
            function eventCanvasOnClick(){
                var eventCanvas = this;
                mathworks.mousewheel.setMouseWheelEventHandler(eventCanvas, eventCanvas.wheelHandler);
                this.focusHolder.focus();
            }
            
            var containerHandlers = {
                mouseover : function(event,toolbar){
                                 toolbar.show();
                            },
                mouseout  : function(event,toolbar){
                                toolbar.hide();
                            }
            };
            
            function makeContainerEventHandler(toolbar, eventType){
                return function(e){
                    var e = e || window.event;
                    return containerHandlers[eventType](e,toolbar);
                }            
            }
            
            function WebFigureWidget(container, figure, scheduler){
                if (!scheduler) {
                    scheduler = new mathworks.loadscheduler.LoadScheduler();
                }
                
                var wfController = new WebFigureController(figure, scheduler);     
                var toolbar = wfController.toolbar;                          
                var eventCanvas  = makeEventCanvas(wfController);                                                    				
                                
                container.appendChild(wfController.view.container);                
                container.appendChild(toolbar.view);                           
                container.appendChild(eventCanvas);
                container.appendChild(toolbar.controller);
                
                container.onmouseover = makeContainerEventHandler(toolbar, 'mouseover');
                container.onmouseout  = makeContainerEventHandler(toolbar, 'mouseout');
                                
                // Some final initialization    
                wfController.resizeEvent(container.offsetWidth, container.offsetHeight);
                
                // Listen for mouse wheel events
                eventCanvas.wheelHandler = makeMouseWheelHandler(wfController);
                
                // Create a textarea element that can hold focus on behalf of the eventCanvas
                eventCanvas.focusHolder = document.createElement('textarea');
                eventCanvas.focusHolder.style.position = 'absolute';
                eventCanvas.focusHolder.style.left = '-500px';
                eventCanvas.focusHolder.onblur = focusHolderOnBlur;
                
                // Add the focusHolder to the eventCanvas
                eventCanvas.appendChild(eventCanvas.focusHolder);
                
                // Move focus to the focus holder when the user clicks on the event canvas
                eventCanvas.onclick = eventCanvasOnClick;
                
                // Listen for resize events
                if (window.attachEvent) {
                    // listen just on container if IE
                    mathworks.util.attachEventHandler(container, 'resize', makeResizeHandler(wfController));
                }
                else {
                    mathworks.util.attachEventHandler(window, 'resize', makeResizeHandler(wfController));
                }
                
                this.wfController = wfController;
                
                return this;
            }
            
            return WebFigureWidget;
            
        }();
    }
});
