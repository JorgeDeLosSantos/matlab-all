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

    name: "mathworks/util/DOMUtils.jsm",
       
    definition: function(context){
    
        window.mathworks = window.mathworks || {};
        mathworks.DOMUtils = mathworks.DOMUtils || {};
                
        mathworks.DOMUtils.makeElement = function(elementName, properties, parent){
             
            var e = document.createElement(elementName);
            if (parent) {
                parent.appendChild(e);
            }
            applyProperties(e, properties);
            return e;
        }
        
        function applyProperties(obj, properties){
            for (var p in properties) {
                if (properties.hasOwnProperty(p)) {
                    if (typeof properties[p] === 'object') {
                        if (!(p in obj)) {
                            obj[p] = {};
                        }
                        applyProperties(obj[p], properties[p]);
                    }
                    else {
                        obj[p] = properties[p];
                    }
                }
            }
        }
    }
});

