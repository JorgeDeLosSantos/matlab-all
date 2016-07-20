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

    name: "mathworks/util/paramsToUrl.jsm",
       
    definition: function(context){
    
        window.mathworks = window.mathworks || {};
        mathworks.util = mathworks.util || {};
                
        mathworks.util.paramsToUrl = function(params){
             
            var arr = new Array();
            
            for(var p in params){				
				if( params.hasOwnProperty(p) ){
					arr.push( escape(p) + "=" + escape(params[p]) );														
				}
			}
			                  
            return arr.join("&");
        }
    }
});

