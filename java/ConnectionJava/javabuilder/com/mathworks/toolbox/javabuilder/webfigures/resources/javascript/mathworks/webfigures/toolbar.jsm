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

    name: "mathworks/webfigures/toolbar.jsm",

    requires: ["mathworks/util/DOMUtils.jsm",
               "mathworks/webfigures/css/webfigureToolbar.css",
               "mathworks/util/DOMFader.jsm",
               "mathworks/util/idmanager.jsm"],

    definition: function(context){

        if (!mathworks.webfigures) {
            mathworks.webfigures = {};
        }

		var moduleDir = this.name.substring(0,this.name.lastIndexOf('/'));
		
		var DEFAULT_BUTTON_DIM  = "25px";
		var DEFAULT_TOOLBAR_DIM = "25px";

		//////////////////////////////////////////////////////////////////////
        // Private functions
        function createTargetCanvas(container, tType){

            var ribbon = mathworks.DOMUtils.makeElement(
                                   'div',{className: "MW_"+tType+"ToolbarRibbon"}, container);

            if(tType === "horizontal"){
                container['canvas'] = ribbon;
            }
            else{

                var canvasContainer = mathworks.DOMUtils.makeElement('div',
		         {className: "MW_vertToolbarCanvasContainer"}, ribbon);

	            var canvas = mathworks.DOMUtils.makeElement('div',
		         {className: "MW_vertToolbarCanvas"}, canvasContainer);

		        container['canvas'] = canvas;
		    }
        }

        function addButtonToTargetCanvas(target, targetName, button, tType){

            var btnParent;
            var bId = button.id;

            if(tType === "vertical"){

            // For vertical toolbar, each icon needs to be wrapped up in a DIV and the wrapper DIV needs to be added
            // to the canvas. This is needed for IE only. Without this, IE shows gap between the vertical toolbar buttons.
            // For all the other browsers, this doesn't have any adverse effects

                btnParent = mathworks.DOMUtils.makeElement('div',
                                                            {id : bId + "_" + targetName + "IconContainer"}, target.canvas);
            }
            else{            
                btnParent = target.canvas;
            }

            target[bId] = mathworks.DOMUtils.makeElement('img',
                                   { id : bId + "_" + targetName + "Icon" },
                                   btnParent);

            if(targetName === "view"){                
                target[bId].src = button.viewIcon;
            }
            else{ //controller                
                target[bId].src   = context.loader.getResource(moduleDir + '/images/transparent_pixel.gif');
                target[bId].title = button.title || mathworks.util.getNextUniqueId("button");
            }
        }        

        function attachButtonEvents(controllerBtn, viewBtn, btnObj){

            if( btnObj.hasOwnProperty('events') ){
                var events = btnObj.events;

			    for(var evt in events){
			        if( events.hasOwnProperty(evt) ){
			            controllerBtn['on' + evt] = function(e){
			                var event = e || window.event;			                			                
			                events[event.type](event, viewBtn, controllerBtn);
			            };
			        }
			    }
			}
        }
        
        function applyDefaultButtonStyle(controllerBtn, viewBtn){
            controllerBtn.style.width  = DEFAULT_BUTTON_DIM;
            controllerBtn.style.height = DEFAULT_BUTTON_DIM;   
            viewBtn.style.width        = DEFAULT_BUTTON_DIM;
            viewBtn.style.height       = DEFAULT_BUTTON_DIM;    
        }                       

        function applyCustomButtonStyle(controllerBtn, viewBtn, btnObj){

            var bId = btnObj.id;

            if(btnObj.hasOwnProperty("style")){

                var bStyle = btnObj["style"];

		        for(s in bStyle)
			    {
			        if(bStyle.hasOwnProperty(s))
			        {
			            controllerBtn.style[s] = bStyle[s];
			            viewBtn.style[s]       = bStyle[s];
			        }
			     }
			}
        }
        
        function provideDefaultToolbarStyle(tType,view,controller){
            // If width or height is not provided, we should provide default dimensions
            if(tType === "horizontal"){
                view.style.width        = "100%";
                view.style.height       = DEFAULT_TOOLBAR_DIM;
                controller.style.width  = "100%";                
                controller.style.height = DEFAULT_TOOLBAR_DIM;                    
            } 
            else{
                view.style.width        = DEFAULT_TOOLBAR_DIM;
                view.style.height       = "100%";
                controller.style.width  = DEFAULT_TOOLBAR_DIM;                                
                controller.style.height = "100%";                    
            }
            
            // Provide default background
            view.style.background = "#CCCCCC";  
            
            // Set the default opacity
            view.style.opacity = "0";
            view.style.filter  = "alpha(opacity=0)";
        }

        // Exported toolbar class
        mathworks.webfigures.toolbar = function(tbConfig){
        // While creating a toolbar, following defaults are used:
        // 1. id                : mathworks.util.getNextUniqueId("defaultToolbarId")
        // 2. orientation       : horizontal
        // 3. background        : "#CCCCCC"
        // 4. dimensions        : DEFAULT_TOOLBAR_DIM and "100%" for toolbar
        // 5. button dimensions : DEFAULT_BUTTON_DIM
        // 6. tooltip           : mathworks.util.getNextUniqueId("button")  
        // 7. button id         : mathworks.util.getNextUniqueId("defaultButtonId")      
    
            var toolbarId  = tbConfig.id || mathworks.util.getNextUniqueId("defaultToolbarId");
            var tType      = tbConfig.orientation || "horizontal"; // Default to horizontal toolbar
            var tbStyle    = tbConfig.style;
            var view       = mathworks.DOMUtils.makeElement('div',{id: toolbarId+"_view", className: "MW_"+tType+"Toolbar"});
			var controller = mathworks.DOMUtils.makeElement('div',{id: toolbarId+"_controller", className: "MW_"+tType+"Toolbar"});
			var fader      = mathworks.util.DOMFader({finalOpacity:85, opacityDelta:5});
			var numButtons = tbConfig.buttons.length;
			var buttons    = tbConfig.buttons;
			var btnIDs     = [];
            
            // Let's provide some defaults. These may or may no tbe overwritten later. It's better to provide the defaults now than
            // providing them after checking to see if user has provided these styles. We will be avoiding the cost of checking by 
            // doing this.
            provideDefaultToolbarStyle(tType,view,controller);
            
            // Now, let's apply what users have provided
		    for(var s in tbStyle){
			    if(tbStyle.hasOwnProperty(s)){
				    view.style[s] = tbStyle[s];	
				    
				    if( s==="width" || s==="height" ){
				        // Apply only width and height to the controller if these dimensions are provided
				        controller.style[s] = tbStyle[s];
				    }			    
				} 
			}
			
	        createTargetCanvas( view      , tType ); // The ribbon is view.canvas
			createTargetCanvas( controller, tType ); // The ribbon is controller.canvas

			for(var i=0; i < numButtons; i++){

			    var button = buttons[i];
			    var btnId  = button.id || mathworks.util.getNextUniqueId("defaultButtonId");
			    button.id  = btnId; //update button object ID if we have used the default one
			    var viewBtn, controllerBtn;

			    btnIDs.push(btnId);
			    addButtonToTargetCanvas(view,       "view",       button, tType);
			    addButtonToTargetCanvas(controller, "controller", button, tType);

			    viewBtn       = view[btnId];
			    controllerBtn = controller[btnId];

			    attachButtonEvents(controllerBtn, viewBtn,  button);
			    
			    // First apply the default styles to the buttons and then apply custom
			    applyDefaultButtonStyle(controllerBtn, viewBtn);
			    applyCustomButtonStyle(controllerBtn, viewBtn, button);
			}

            return {
			    view        : view,
			    controller  : controller,
		        orientation : tType,
		        id          : toolbarId,
		        buttonIDs   : btnIDs, 

	            hide        : function(){
                                 controller.style.visibility = "hidden";
                                 fader.hide(view);
                              },

                show        : function(){
                                 controller.style.visibility = "visible";
                                 fader.show(view);
                              }
			};
        }; // End mathworks.webfigures.toolbar
    } // End definition
}); // End mathworks.module
