// Cross-browser support for handling mouse wheel events

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

    name: "mathworks/mousewheel/mousewheel.jsm",
    
    definition: function(context){
    
        if (!mathworks.mousewheel) {
            mathworks.mousewheel = {
                eventHandler: function(event){
                    var delta = 0;
                    
                    // IE
                    if (!event) {
                        event = window.event;
                    }
                    
                    // IE/Opera
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                    }
                    // Mozilla
                    else if (event.detail) {
                            /* In Mozilla, sign of delta is different than in IE.
                         * Also, delta is multiple of 3.
                         */
                            delta = -event.detail / 3;
                        }
                    
                    /* If delta is nonzero, handle it.
                     * Basically, delta is now positive if wheel was scrolled up,
                     * and negative, if wheel was scrolled down.
                     */
                    if (delta) {
                        this.mouseWheelEventCallback(delta);
                    }
                    
                    /* Prevent default actions caused by mouse wheel.
                     * That might be ugly, but we handle scrolls somehow
                     * anyway, so don't bother here..
                     */
                    if (event.preventDefault) {
                        event.preventDefault();
                    }
                    
                    if (event.stopPropagation) {
                        event.stopPropagation();
                    }
                    
                    if (event.stopImmediatePropagation) {
                        event.stopImmediatePropagation();
                    }
                    
                    event.returnValue = false;
                    
                    return false;
                },
                
                setMouseWheelEventHandler: function(element, callback){
                    element.mouseWheelEventCallback = callback;
                    // Mozilla
                    if (!window.opera && element.addEventListener) {
                        element.addEventListener('DOMMouseScroll', mathworks.mousewheel.eventHandler, false);
                    }
                    else {
                        // IE/Opera
                        element.onmousewheel = mathworks.mousewheel.eventHandler;
                    }
                },
                
                clearMouseWheelEventHandler: function(element, callback){
                    element.mouseWheelEventCallback = null;
                    // Mozilla
                    if (!window.opera && element.removeEventListener) {
                        element.removeEventListener('DOMMouseScroll', mathworks.mousewheel.eventHandler, false);
                    }
                    else {
                        // IE/Opera
                        element.onmousewheel = null;
                    }
                }
            };
        }
    }
});
