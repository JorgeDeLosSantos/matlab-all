
// Modified to fix bugs on Mozilla and IE. Make sure we don't add the same script
// node twice to the DOM tree. -Joe Conti 6/28/06


// jsr_class.js
//
// JSONscriptRequest -- a simple class for making HTTP requests
// using dynamically generated script tags and JSON
//
// Author: Jason Levitt
// Date: December 7th, 2005
//
// A SECURITY WARNING FROM DOUGLAS CROCKFORD:
// "The dynamic <script> tag hack suffers from a problem. It allows a page 
// to access data from any server in the web, which is really useful. 
// Unfortunately, the data is returned in the form of a script. That script 
// can deliver the data, but it runs with the same authority as scripts on 
// the base page, so it is able to steal cookies or misuse the authorization 
// of the user with the server. A rogue script can do destructive things to 
// the relationship between the user and the base server."
//
// So, be extremely cautious in your use of this script.
//
//
// Sample Usage:
//
// <script type="text/javascript" src="jsr_class.js"></script>
// 
// function callbackfunc(jsonData) {
//      alert('Latitude = ' + jsonData.ResultSet.Result[0].Latitude + 
//            '  Longitude = ' + jsonData.ResultSet.Result[0].Longitude);
//      aObj.removeScriptTag();
// }
//
// request = 'http://api.local.yahoo.com/MapsService/V1/geocode?appid=YahooDemo&
//            output=json&callback=callbackfunc&location=78704';
// aObj = new JSONscriptRequest(request);
// aObj.buildScriptTag();
// aObj.addScriptTag();
//
//

gJSONCache = new Array();
	
// Constructor -- pass a REST request URL to the constructor
//
function JSONscriptRequest(fullUrl) {
	 
    // Keep IE from caching requests
    this.noCacheIE = '&noCacheIE=' + (new Date()).getTime();
    // Get the DOM location to put the script tag
    this.headLoc = document.getElementsByTagName("head").item(0);
	// REST request
	this.url = fullUrl + this.noCacheIE;
}

// Static script ID counter
JSONscriptRequest.scriptCounter = 1;

// buildScriptTag method
JSONscriptRequest.prototype.buildScriptTag = function () {

    // Create the script tag
    this.scriptObj = document.createElement("script");
    
    // Add script object attributes
    this.scriptObj.setAttribute("type", "text/javascript");
    this.scriptObj.setAttribute("charset", "utf-8");
    this.scriptObj.setAttribute("src", this.url);
    this.scriptObj.setAttribute("id", this.url);
}
 
// removeScriptTag method
JSONscriptRequest.prototype.removeScriptTag = function () {
    
	// Destroy the script tag
	var node = document.getElementById(this.url);
	if(node!=null) {
        this.headLoc.removeChild(node); 
	} 
}

// addScriptTag method
JSONscriptRequest.prototype.addScriptTag = function () {
	
	// This guard is necessary to prevent bugs in Mozilla and IE	
	// This function would inadvertantly get called twice causing the client
	// caller to get confused and error. -Joe Conti	
	if (gJSONCache[this.url]==null) {
		gJSONCache[this.url] = true;
        this.headLoc.appendChild(this.scriptObj);
	}
}

