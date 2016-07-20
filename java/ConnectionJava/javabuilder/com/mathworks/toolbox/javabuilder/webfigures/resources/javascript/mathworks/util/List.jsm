// mathworks.util.List - linked list

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
	
    name: "mathworks/util/List.jsm",
    
    definition: function(context){
        if (!mathworks.util) {
            mathworks.util = {};
        }
        
        mathworks.util.List = function(){
            var nextHandle = 0;
            
            var List = function(){
                this.first = null;
                this.last = null;
                this.handle = nextHandle++;
                this.length = 0;
            };
            
            function resetLinks(obj, list){
                if (!obj.links) {
                    obj.links = {};
                }
                if (list.handle in obj.links) {
                    list.unlink(obj);
                }
                obj.links[list.handle] = {};
                return obj.links[list.handle];
            }
            
            function getLinks(obj, list){
                if (!obj.links || !obj.links[list.handle]) {
                    throw new Error("mathworks.util.List.unlink: obj is not a part of this list!");
                }
                return obj.links[list.handle];
            }
            
            List.prototype.insertFirst = function(obj){
                var objLinks = resetLinks(obj, this);
                if (this.first) {
                    getLinks(this.first, this).prev = obj;
                }
                else {
                    this.last = obj;
                }
                objLinks.next = this.first;
                objLinks.prev = null;
                this.first = obj;
                this.length++;
            };
            
            List.prototype.insertLast = function(obj){
                var objLinks = resetLinks(obj, this);
                if (this.last) {
                    getLinks(this.last, this).next = obj;
                }
                else {
                    this.first = obj;
                }
                objLinks.prev = this.last;
                objLinks.next = null;
                this.last = obj;
                this.length++;
            };
            
            List.prototype.insertAfter = function(ref, obj){
                if (ref === null) {
                    this.insertLast(obj);
                }
                else {
                    var objLinks = resetLinks(obj, this);
                    var refLinks = getLinks(ref, this);
                    if (refLinks.next) {
                        getLinks(refLinks.next, this).prev = obj;
                    }
                    else {
                        this.last = obj;
                    }
                    objLinks.next = refLinks.next;
                    objLinks.prev = ref;
                    refLinks.next = obj;
                    this.length++;
                }
            };
            
            List.prototype.insertBefore = function(ref, obj){
                if (ref === null) {
                    this.insertFirst(obj);
                }
                else {
                    var objLinks = resetLinks(obj, this);
                    var refLinks = getLinks(ref, this);
                    if (refLinks.prev) {
                        getLinks(refLinks.prev, this).next = obj;
                    }
                    else {
                        this.first = obj;
                    }
                    objLinks.prev = refLinks.prev;
                    objLinks.next = ref;
                    refLinks.prev = obj;
                    this.length++;
                }
            };
            
            List.prototype.unlink = function(obj){
                try {
                    var objLinks = getLinks(obj, this);
                    if (objLinks.prev) {
                        getLinks(objLinks.prev, this).next = objLinks.next;
                    }
                    else {
                        this.first = objLinks.next;
                    }
                    if (objLinks.next) {
                        getLinks(objLinks.next, this).prev = objLinks.prev;
                    }
                    else {
                        this.last = objLinks.prev;
                    }
                    delete obj.links[this.handle];
                    this.length--;
                    return true;
                } 
                catch (e) {
                    return false;
                }
            };
            
            List.prototype.removeFirst = function(){
                var obj = this.first;
                this.unlink(obj);
                return obj;
            };
            
            List.prototype.removeLast = function(){
                var obj = this.last;
                this.unlink(obj);
                return obj;
            };
            
            return List;
        }();
    }
});
