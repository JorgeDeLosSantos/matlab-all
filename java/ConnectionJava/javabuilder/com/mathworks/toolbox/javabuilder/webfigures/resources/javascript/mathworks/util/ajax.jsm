/**
 * Copyright 2007 The MathWorks, Inc.
 */

/**
  * This module requires external/jsonorg/jsr_class.js which is a 3rd party javascript.
  * We are going to keep the 3rd party source as it and not changing it to be a module
  */

mathworks.module({
	
    name: "mathworks/util/ajax.jsm",
    
    definition: function(context){
    
        // create the namespace
        mathworks.util = mathworks.util || {};
        
        // For now, use a global array to hold all JSON requests
        mathworks.util.JSONQueue = [];
        
        mathworks.util.Ajax = {};
        mathworks.util.Ajax.makeJSONRequest = function(url, callback, srcObj){
        
            // Create a new JSON request object
            bObj = new JSONscriptRequest(url);
            
            // Store the callback handle as a dynamic property
            bObj.callback = callback;
            bObj.srcObj = srcObj;
            
            // Add it to the queue
            mathworks.util.JSONQueue.push(bObj);
            
            // Dispatch JSON object if the queue has only one element
            if (mathworks.util.JSONQueue.length == 1) {
                bObj.buildScriptTag();
                bObj.addScriptTag();
            }
        };
        
        // "jsoncallback" is defined in JSONServlet.java
        // This fires when the script is added to the DOM node
        window.jsoncallback = function (res){
        
            // The queue should have at least one element
            if (mathworks.util.JSONQueue.length > 0) {
                // MUST call this to avoid sporadic callbacks
                mathworks.util.JSONQueue[0].removeScriptTag();
                
                // Dequeue
                var obj = mathworks.util.JSONQueue.shift();
                obj.callback(res, obj.srcObj);
                
                // Dispatch next item in the queue
                if (mathworks.util.JSONQueue.length > 0) {
                    obj = mathworks.util.JSONQueue[0];
                    
                    //dispatch    
                    obj.buildScriptTag();
                    obj.addScriptTag();
                }
            }
            else {
                //alert("ERROR: " + mathworks.util.JSONQueue.length);
            }
        }
    }
});


