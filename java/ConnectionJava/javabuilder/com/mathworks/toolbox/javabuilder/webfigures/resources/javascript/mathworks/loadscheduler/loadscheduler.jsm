// mathworks.loadscheduler.LoadScheduler - manages the downloading of resources

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
	
    name: "mathworks/loadscheduler/loadscheduler.jsm",
    
    requires: ["mathworks/util/List.jsm", 
	           "mathworks/util/events.jsm"],
    
    definition: function(context){
    
        if (!mathworks.loadscheduler) {
            mathworks.loadscheduler = {};
        }
        
        mathworks.loadscheduler.LoadScheduler = function(){
            function LoadScheduler(){
                // allow two concurrent requests (mirror the default browser max connection value)
                this.maxConcurrent = 2;
                
                // these properties reflect the current state of the scheduler
                this.queue = new mathworks.util.List();
                this.numStarted = 0;
                
                // these properties are for keeping some statistics 
                this.numCancelled = 0;
                this.numFailed = 0;
                this.requestOverrides = 0;
            }
            
            // this function will run when the page is unloaded, to prevent memory leaks
            // due to reference counting bugs in IE
            function makeEventDetacher(loadJob){
                return function(){
                    loadJob.img.onload = null;
                    loadJob.img.mathworks_loadscheduler_loadJob = null;
                    if (loadJob.started && loadJob.started.callback) {
                        loadJob.started.callback = null;
                    }
                    if (loadJob.pending && loadJob.pending.callback) {
                        loadJob.pending.callback = null;
                    }
                };
            }
            
            function getLoadJob(img, create){
                if (undefined === create) {
                    create = true;
                }
                if (create && !img.mathworks_loadscheduler_loadJob) {
                    var loadJob = {
                        started: null,
                        pending: null,
                        img: img
                    };
                    loadJob.eventDetacher = makeEventDetacher(loadJob);
                    img.mathworks_loadscheduler_loadJob = loadJob;
                    mathworks.util.attachEventHandler(window, 'unload', loadJob.eventDetacher);
                }
                return img.mathworks_loadscheduler_loadJob;
            }
            
            LoadScheduler.prototype.loadImage = function(img, srcUrl, callback){
                var loadJob = getLoadJob(img);
                
                // if there is a pending request on this image, over-write it here
                if (loadJob.pending) {
                    this.requestOverrides++;
                    if (this.onchange) {
                        this.onchange();
                    }
                }
                
                loadJob.pending = {};
                loadJob.pending.url = srcUrl;
                loadJob.pending.callback = callback;
                
                // if there is a started request on this image, then wait until it completes or times out
                //  INVARIANT: only one started request allowed per image
                if (!loadJob.started) {
                    this.queue.insertFirst(loadJob);
                    if (this.onchange) {
                        this.onchange();
                    }
                    if (this.numStarted < this.maxConcurrent) {
                        this.startNextJob();
                    }
                }
            };
            
            LoadScheduler.prototype.startNextJob = function(){
                if (this.queue.length > 0) {
                    this.numStarted++;
                    
                    var loadJob = this.queue.removeFirst();
                    var scheduler = this;
                    loadJob.started = loadJob.pending;
                    loadJob.pending = null;
      
                    //On error or abort we want to free up the queue to process the next image.
                    loadJob.img.onerror = function(){
                        scheduler.notifyLoaded(loadJob, true);
                    };
                    loadJob.img.onabort = loadJob.img.onerror;
                    
                    loadJob.img.onload = function(){
                        scheduler.notifyLoaded(loadJob);
                    };
                    loadJob.img.src = loadJob.started.url;
                    
                    if (this.onchange) {
                        this.onchange();
                    }
                }
            };
            
            LoadScheduler.prototype.notifyLoaded = function(loadJob, imgLoadError){
                var scheduler = this;
                this.numStarted--;
                // no duplicate events, please
                loadJob.img.onload = null;
                if (imgLoadError) {
                    this.numFailed++;
                }
                else {
                    // only invoke the callback if the request was completed, not errored out or cancelled
                    if (loadJob.started.callback) {
                        loadJob.started.callback();
                    }
                }
                loadJob.started = null;
                if (loadJob.pending) {
                    this.queue.insertFirst(loadJob);
                }
                else {
                    loadJob.img.mathworks_loadscheduler_loadJob = null;
                    mathworks.util.detachEventHandler(window, 'unload', loadJob.eventDetacher);
                }
                if (this.numStarted < this.maxConcurrent) {
                    // prevent re-entry to this function
                    setTimeout(function(){
                        scheduler.startNextJob();
                    }, 0);
                }
                if (this.onchange) {
                    this.onchange();
                }
            };
            
            LoadScheduler.prototype.hasStartedLoading = function(img){
                var loadJob = getLoadJob(img, false);
                return loadJob && loadJob.started;
            };
            
            LoadScheduler.prototype.cancelImageRequest = function(img){
                var loadJob = getLoadJob(img, false);
                if (loadJob) {
                    this.numCancelled++;
                    if (this.onchange) {
                        this.onchange();
                    }
                    loadJob.pending = null;
                    this.queue.unlink(loadJob);
                    if (!loadJob.started) {
                        loadJob.img.mathworks_loadscheduler_loadJob = null;
                        loadJob.img.onload = null;
                        mathworks.util.detachEventHandler(window, 'unload', loadJob.eventDetacher);
                    }
                    else {
                        // clear the callback (client has asked for this job to be cancelled, so
                        //  it is not expecting notification that it has completed)
                        loadJob.started.callback = null;
                    }
                }
            };
            
            return LoadScheduler;
        }();
    }
});
