// mathworks.util - event handler related functions

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
	
    name: "mathworks/util/events.jsm",
    
    definition: function(context){
        if (!mathworks.util) {
            mathworks.util = {};
        }
        
        if (window.addEventListener) {
        
            mathworks.util.attachEventHandler = function(obj, whichEvent, handler){
                obj.addEventListener(whichEvent, handler, false);
            };
            
            mathworks.util.detachEventHandler = function(obj, whichEvent, handler){
                obj.removeEventListener(whichEvent, handler, false);
            };
        }
        else if (window.attachEvent) {
            
                mathworks.util.attachEventHandler = function(obj, whichEvent, handler){
                    obj.attachEvent("on" + whichEvent, handler);
                };
                
                mathworks.util.detachEventHandler = function(obj, whichEvent, handler){
                    obj.detachEvent("on" + whichEvent, handler);
                }
            }
            else {
                mathworks.util.attachEventHandler = function(obj, whichEvent, handler){};
                mathworks.util.detachEventHandler = function(obj, whichEvent, handler){};
            }
    }
});
