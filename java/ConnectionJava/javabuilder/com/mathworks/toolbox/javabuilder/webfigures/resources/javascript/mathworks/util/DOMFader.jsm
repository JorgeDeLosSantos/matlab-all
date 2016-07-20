/*
 * CONFIDENTIAL AND CONTAINING PROPRIETARY TRADE SECRETS
 * Copyright (c) 2007 The MathWorks, Inc. All Rights Reserved.
 * The source code contained in this listing contains proprietary and
 * confidential trade secrets of The MathWorks, Inc.  The use, modification,
 * or development of derivative work based on the code or ideas obtained
 * from the code is prohibited without the express written permission of The
 * MathWorks, Inc. The disclosure of this code to any party not authorized
 * by The MathWorks, Inc. is strictly forbidden.
 * CONFIDENTIAL AND CONTAINING PROPRIETARY TRADE SECRETS
 */
mathworks.module({

    name: "mathworks/util/DOMFader.jsm",
       
    definition: function(context){
    
        window.mathworks = window.mathworks || {};
        mathworks.util   = mathworks.util || {};
                
        mathworks.util.DOMFader = function(fadingConfig){
        // An instance of  DOMFader is tied up to a unique DOM element. If you want to fade multiple
        // DOM elements, you should create a DOMFader for each of the DOM elements. DO NOT share a 
        // DOMFader across multiple DOM elements.
        
            var finalOpacity  = fadingConfig.finalOpacity;
            var delta         = fadingConfig.opacityDelta;            
            var timer;
            var timerInterval = 5;             
            var fadingIn      = false;
            var fadingOut     = false;
            
            function fade(d, ele, fun){
                // d=1  => Make it visible or increare opacity
                // d=-1 => Make it invisible or reduce opacity
                var endAlpha;
                var currentAlpha = ele.style.opacity ?  ele.style.opacity*100 : ele.filters.alpha.opacity;                    
                    
                if(d==1){
                    endAlpha = finalOpacity;    
                }
                else{
                    endAlpha = 0;
                }
                                        
                if ( currentAlpha !== endAlpha ) {                        
                    if (d === 1) {
                        currentAlpha = currentAlpha + ( (endAlpha-currentAlpha < delta) ? (endAlpha-currentAlpha) : delta );
                    }
                    else{ 
                        currentAlpha = currentAlpha - ( currentAlpha<delta ? currentAlpha : delta );
                    }                        
                    ele.style.opacity = currentAlpha * .01; // Firefox                                                               
                    ele.style.filter  = 'alpha(opacity=' + currentAlpha + ')'; // IE
                }
                else {
                    fadingIn  = false;
                    fadingOut = false;
                    clearInterval(timer);
                    if (d === -1) {
                        ele.style.visibility = "hidden";
                        if (fun){ 
                            fun();
                        }
                    }
                }            
            } // End fade
            
            return {
                show : function(ele){
                    ele.style.visibility = "visible";
                    
                    if(timer){                   
                        clearInterval(timer);
                    }                    
                    fadingIn  = true;
                    fadingOut = false;
                    timer  = setInterval(function(){
                        fade(1, ele);
                    }, timerInterval);                             
                },
                
                hide : function(ele, fun){                
                    
                    if(timer){
                        clearInterval(timer);
                    }                    
                    fadingIn  = false;
                    fadingOut = true;
                    timer  = setInterval(function(){
                        fade(-1, ele, fun);
                    }, timerInterval);  
                },
                
                interrupt : function(){
                    if(timer){
                        clearInterval(timer);
                        fadingIn  = false;
                        fadingOut = false;
                    }
                },
                
                isFadingIn : function(){
                    return fadingIn;                    
                },
                
                isFadingOut : function(){
                    return fadingOut;                    
                },
                
                isFading  : function(){
                    return fadingIn || fadingOut;
                }         
            };
        } // End mathworks.util.DOMFader
    } // End definition
}); // End mathworks.moduele

