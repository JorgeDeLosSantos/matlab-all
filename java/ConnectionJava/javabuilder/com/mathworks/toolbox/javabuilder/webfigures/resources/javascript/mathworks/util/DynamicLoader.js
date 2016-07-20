/**
 * /mathworks/util/DynamicLoader.js - Dynamic module loading for JavaScript
 */

var mathworks = mathworks || {};

(function () {

    var DEFAULT_SCRIPT_REQUEST_TIMEOUT = 60 * 1000; // milliseconds

    /**
     * Iterate over the elements of Array a, calling f on each element.
     * @return nothing
     */
    function foreach(a, f) {
        var len = a.length, i;
        for (i = 0; i < len; ++i) {
            if (f(a[i])) {
                break;
            }
        }
    }

    // define namespace mathworks.util
    mathworks.util = mathworks.util || {};

    /**
     * Implements asynchronous actions based on a one-time event.
     *
     * A Condition object is created initially in the 'false' state.
     * Using the 'whenTrue' method, listeners can attach callbacks to
     * be run once this state has changed to 'true'.  If the Condition's
     * state is 'true' when the 'whenTrue' method is called, then the
     * callback is immediately invoked.  The Condition's state may
     * be changed from 'false' to 'true' via the 'setTrue' method.
     *
     * @return the newly created object (this)
     */
    function Condition() {
        var listeners = [], state = false;

        /**
         * Call the given function ('f') as soon as this object's
         * state is 'true'.  If the state is 'true' when this method
         * is invoked, then 'f' is invoked immediately.
         *
         * @return nothing
         */
        this.whenTrue = function (f) {
            if (true === state) {
                f();
            } else {
                listeners.push(f);
            }
        };

        /**
         * Sets this object's state to 'true' and invokes all callbacks
         * attached to this object.
         *
         * @return nothing.
         */
        this.setTrue = function () {
            if (false === state) {
                state = true;
                foreach(listeners, function (f) {
                    f();
                });
                listeners = [];
            }
        };

        return this;
    }
    mathworks.util.Condition = Condition;

    /**
     * Get the canonical object representing the given named module.
     */
    var getModule = function () {
        var modules = {};
        return function (name) {
            var module = modules[name];
            if (!module) {
                module = {
                    requested: new Condition(),
                    loaded: new Condition()
                };
                modules[name] = module;
            }
            return module;
        };
    }();

    /*global window */
    window.object = window.object || function (proto) {
        var F = function () {};
        F.prototype = proto;
        return new F();
    };

    /**
     * Constructor for LoaderClient objects, which represent the requester or
     * set of requesters that have triggered the loading/definition of a module.
     *
     * LoaderClient objects have the following properties:
     *
     * name - the name of the most immediate requester.  This is usually the
     *     name of the module that names other modules as requirements.
     * contains - an object containing properties for all the other requesters
     *     associated with this client.  Usually this is name plus the name of
     *     the client that requested that module, plus the name of the client that
     *     requested that module, etc.
     * toString - prints out 'who requested who' in order for debugging and
     *     diagnostic purposes.
     *
     * There can be many modules to a single LoaderClient, but each module has
     * at most one LoaderClient.  The LoaderClient for a modules is stored in
     * the module's 'loadedBy' property.
     *
     * @param {Object} name The name of the most immediate requester
     * @param {Object} client (optional) A LoaderClient to extend (usually the
     *     module that requested 'name')
     */
    function LoaderClient(name, client) {
        if (name) {
            client = client || new LoaderClient();
            this.name = name;
            /*global object */
            this.contains = object(client.contains);
            this.contains[name] = true;
            this.toString = function () {
                return client.toString() + name + ' > ';
            };
        }
        return this;
    }
    LoaderClient.prototype = {
        name: null,
        contains: {},
        toString: function () {
            return '';
        }
    };
    mathworks.util.LoaderClient = LoaderClient;

    function raiseError(message, errorHandler) {
        var e = new Error(message);
        e.toString = function () {
            return 'Error: ' + message;
        };
        /*global window */
        if (errorHandler) {
            errorHandler(e);
            return true;
        } else {
            throw e;
        }
    }
    
    function isCSS(moduleName){
    
        var resourceExt = moduleName.substring( moduleName.lastIndexOf(".") + 1 );
        return resourceExt === "css";
    }
    
    var insertCSS = function(){
        var cssContainer={};
        
        return function(moduleName,moduleUrl){
            // Insert the CSS style sheet only if it hasn't been already added
            if( !cssContainer[moduleUrl] ){
                cssContainer[moduleUrl] = true;
                var head = document.getElementsByTagName("head").item(0);
                var cssTag = document.createElement("link");
                cssTag.setAttribute("id", moduleName);
                cssTag.setAttribute("type", "text/css");
                cssTag.setAttribute("rel", "stylesheet");  	                
                cssTag.setAttribute("href", moduleUrl);                
                head.appendChild(cssTag);          
  	        } 
        };    
    }();    

    var insertScript = function () {
        // Cache a reference to the HEAD element
        /*global document */
        var head = document.getElementsByTagName("head").item(0);

        // used to track HTTP requests for scripts so we don't create two script
        //  elements with the same src attribute
        var scriptElement = {};

        return function (moduleName, moduleUrl, timeoutMillisec, errorHandler) {
            if (!scriptElement[moduleUrl]) {
                /*global document */
                var script, verifyModuleDeclared, restoreScriptEvents, timeoutId;

                script = document.createElement('script');
                script.setAttribute("id", moduleName);
                script.setAttribute("type", "text/javascript");
                script.setAttribute("charset", "utf-8");
                script.setAttribute("src", moduleUrl);

                verifyModuleDeclared = function () {
                    var m = getModule(moduleName);
                    if (!m.declared) {
                        raiseError(["Module name/URL mismatch: script file loaded from '",
                                    moduleUrl, "' failed to define the module named '",
                                    moduleName, "'"].join(''), errorHandler);
                    }
                };

                restoreScriptEvents = function () {
                    var saved_onload = script.onload,
                        saved_onreadystatechange = script.onreadystatechange;
                    return function () {
                        script.onload = saved_onload;
                        script.onreadystatechange = saved_onreadystatechange;
                    };
                }();

                timeoutId = setTimeout(function () {
                    raiseError(["Timed out after ", timeoutMillisec,
                                "ms while trying to load script from URL '",
                                moduleUrl, "' for module '", moduleName, "'"].join(''), 
                               errorHandler);
                }, timeoutMillisec);

                script.onload = function () {
                    clearTimeout(timeoutId);
                    restoreScriptEvents();
                    verifyModuleDeclared();
                };

                script.onreadystatechange = function () {
                    if (/loaded|complete/.test(script.readyState)) {
                        clearTimeout(timeoutId);
                        restoreScriptEvents();
                        verifyModuleDeclared();
                    }
                };

                head.appendChild(script);
                scriptElement[moduleUrl] = script;
            }
        };
    }();

    /**
     * Creates an array out of one of the following:
     *  - An array (just return the input in this case)
     *  - A string (the string becomes the sole element of a new array)
     *  - Any falsy value (return a new empty array)
     */
    function makeModuleList(x) {
        return x ? (typeof(x) === typeof('') ? [x] : x) : [];
    }

    /**
     * Create a new dyanamic loader object.
     */
    /*
    config = {
        (optional) scriptRoot : string, 
        (optional) urlFactory : function, 
        (optional) perRequestTimeout : number, 
        (optional) errorHandler : function, 
    }
    */     
    function DynamicLoader(config) {
        var loader = this;
        
        // the default urlFactory (path-wise) concatenates scriptRoot and the given name
        var urlFactory = config && config.urlFactory || function () {
            var resourceRoot = config && config.scriptRoot || "";
            // trim slashes at the end of resourceRoot
            resourceRoot = resourceRoot.match(/$|.*[^\/]/)[0];
            if ("" !== resourceRoot) {
                resourceRoot = resourceRoot + '/';
            }
            return function (resourceName) {
                // use regular expressions to trim superfluous slashes from the beginning of 
                //  moduleName 
                return resourceRoot + resourceName.match(/$|[^\/].*/)[0];
            };
        }();
        
        /**
         * DynamicLoader.load
         *
         * request = {
         *     (optional) moduleList : string | [string] | [],
         *     (required) onSuccess : function,
         *     (optional) onError : function,
         *     (optional) loadedBy : LoaderClient,
         *     (optional) perRequestTimeout : number
         * }
         */
        this.load = function (request) {
            var modulesToLoad = makeModuleList(request.moduleList);
            var callback = request.onSuccess || function () {};
            var numPending = modulesToLoad.length;
            if (0 === numPending) {
                //If the module being loaded does not have any dependencies, invoke
                //it's onSuccess or definition depending on how we get here. This is going to
                //follow the call to module.loaded.setTrue()
                callback();
            } else {
                var errorHandler = request.onError || config && config.errorHandler;
                var perRequestTimeout = request.perRequestTimeout || 
                                        config && config.perRequestTimeout ||
                                        DEFAULT_SCRIPT_REQUEST_TIMEOUT;
                                                        
                // if no client is specified, create a new empty one
                var loadedBy = request.loadedBy || new LoaderClient();
                
                // iterate through all the listed dependencies
                foreach(modulesToLoad, function (moduleName) {                    
                    var moduleUrl = urlFactory(moduleName, loadedBy);
                    
                    if( isCSS(moduleName) ){
                    // Short circuiting for CSS. Diverting from the module and will have to manually
                    // decrement numPending. 
                        insertCSS(moduleName,moduleUrl);                                             
                        if(0 === --numPending){                            
                            callback();
                        }                                            
                    }
                    else{
                        // BEGIN HACK 
                        // Following loadedBy.toString() call is a hack to make things work fine in firefox (at least v3.5.8).
                        // Without this call, loadedBy does not seem to contain moduleName even when one would expect it to be
                        // there in case of circular dependency. This happens sporadically. Only the call to toString() seems 
                        // to be doing the trick. 
                        loadedBy.toString();                                                                 
                        // END HACK
                        
                        if (loadedBy.contains[moduleName]) {
                            return raiseError(['Circular dependency detected: ', 
                                               loadedBy.toString(), moduleName].join(''), errorHandler);
                        }
                        
                        var module = getModule(moduleName);
                        if (!module.context) {
                            var resourcesLoadedBy = new LoaderClient(moduleName, loadedBy);
                            module.context = {
                                loader: {
                                    load: function (request) {
                                        request.onError = request.onError || errorHandler;
                                        request.perRequestTimeout = request.perRequestTimeout || perRequestTimeout;
                                        request.loadedBy = request.loadedBy || resourcesLoadedBy;
                                        return loader.load(request);
                                    },
                                    getResource: function (resourceName, loadedBy) {
                                        return urlFactory(resourceName, loadedBy || resourcesLoadedBy);
                                    }
                                }
                            }; // End module.context 
                            
                            // the following line must come after we set module.context,
                            //  as listeners for the requested Condition are
                            //  expecting module.context to be defined.
                            module.requested.setTrue();
                        }
                        module.loaded.whenTrue(function () {
                            if (0 === --numPending) {
                                // This callback corresponds to the parent module's onSuccess or definition method.
                                // This is where we begin the process of calling the parent module's methods. We call
                                // parent when all the children have been loaded (numPending == 0). 
                                callback();
                            }
                        });
                        if (!module.declared && !module.requestSent) {                            
                            insertScript(moduleName, moduleUrl, perRequestTimeout, errorHandler);                            
                            module.requestSent = true;
                        }
                    } 
                    
                }); // End foreach
            }
        }; // End this.load
        
        /**
         * Get the URL for a resource name.
         */
        this.getResource = urlFactory;
        
        return loader;
    }
    mathworks.util.DynamicLoader = DynamicLoader;

    /**
     * Declare a module.  The single argument to this function is an object
     * modelling the ModuleSpec concept.  A ModuleSpec has the following
     * properties:
     *
     *   name (required, string): the name of the module
     *   requires (optional, array of strings or string): a list of modules to
     *       be loaded before the definition of this module is run
     *   definition (required, function) : a function that defines the modules
     *
     * When all of the pre-requisites of the given module are loaded, the module's
     * definition function is run.  It is up to the definition function to add
     * to the DOM any API's that the module wishes to make public.
     *
     * Example:
     *
     * mathworks.module({
     *     name: 'counter.js',
     *     requires: ['counter_helper.js', 'utils.js'],
     *     definition: function () {
     *         var next = 0;
     *         window.count = function () {
     *             return next++;
     *         };
     *     }
     * });
     */
    mathworks.module = function (moduleSpec) {
        var module = getModule(moduleSpec.name), defineModule, prerequisites;        
        if (!module.declared) {
            module.declared = true;
            defineModule = function () {
                moduleSpec.definition(module.context);
                // The following call will result in the module.loaded.whenTrue() call.
                // The context for module.loaded.whenTrue() is the parent module context
                module.loaded.setTrue();
            };
            module.requested.whenTrue(function () {
                module.context.loader.load({
                    moduleList : moduleSpec.requires,
                    onSuccess : defineModule
                });
            });
        }
        return module;
    };
	
	/**
	 * This function can be used to query the url to get the name value pairs. This is useful
	 * especially for Builder NE since we use the url to pass the interface.html params  
	 * @param {Object} name
	 */	
	mathworks.util.getQueryStringParameter = function(name){
	
	    var start = location.search.indexOf("?" + name + "=");
	    if (start < 0) {
	        start = location.search.indexOf("&" + name + "=");
	    }
	    if (start < 0) {
	        return '';
	    }
	    start += name.length + 2;
	    var end = location.search.indexOf("&", start) - 1;
	    if (end < 0) {
	        end = location.search.length;
	    }
	    var result = '';
	    for (var i = start; i <= end; i++) {
	        var c = location.search.charAt(i);
	        result = result + (c === '+' ? ' ' : c);
	    }
	    return unescape(result);	
	};

    /**
     * This function will be used to get the session ID from URL. 
     */
    mathworks.util.getJSESSIONID = function(){            
            var start = location.href.indexOf(";jsessionid");
            var end = location.href.indexOf("?");
            return (start===-1)?"":location.href.substring(start, end);
	   };
    
})();

