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
	
    name: "mathworks/util/idmanager.jsm",
    
    definition: function(context){
    
        if (!mathworks.util) {
            mathworks.util = {};
        }
        
        mathworks.util.getNextUniqueId = function(){
            var typeCount = {};
            
            function getNextUniqueId(t){
                if (!t) {
                    t = 'mathworks_unique_id';
                }
                
                if (!(t in typeCount)) {
                    typeCount[t] = 0;
                }
                
                return t.toString() + (typeCount[t]++);
            }
            
            return getNextUniqueId;
        }();
    }
});
