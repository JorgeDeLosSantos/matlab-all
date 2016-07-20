// JavaScript for 3D spinning cube.  Requires fast_trig.js

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
/*
 * Example usage:
 * <html>
 * <body>
 *
 * <!-- First, include this file -->
 * <script type="text/javascript" src='cube3d/cube3d.js'></script>
 *
 * <!-- NOTE: it is crucial that initialization happen in a separate script,
 *      prior to usage of the cube3d library -->
 *
 * <!-- Now, create a Cube3D object, initialize its properties, and display it -->
 * <script type="text/javascript">
 * var myCube1 = new mathworks.cube3d.Cube3D();
 * myCube1.setAspectRatio(3,4);
 * myCube1.setAngle(60,45);
 * myCube1.setPosition(350,300);
 * myCube1.setColor(Cube3DColor.WHITE_ALPHA);
 * myCube1.show();
 * </script>
 * </body>
 * </html>
 */
mathworks.module({

    name: "mathworks/cube3d/cube3d.jsm",
    
    requires: ["mathworks/fast_trig/fast_trig.jsm", 
	           "mathworks/util/idmanager.jsm"],
    
    definition: function(context){
    
        if (!mathworks.cube3d) {
            mathworks.cube3d = {};
        }
		
		var moduleDir = this.name.substring(0,this.name.lastIndexOf('/')); 
        
        mathworks.cube3d.isFirefox = navigator.userAgent.indexOf('Firefox') !== -1;
        mathworks.cube3d.isIE = navigator.userAgent.indexOf('MSIE') !== -1;
        if (mathworks.cube3d.isIE) {
            var temp = navigator.appVersion.split('MSIE');
            mathworks.cube3d.browserVersion = parseFloat(temp[1]);
        }
        mathworks.cube3d.useAlpha = !(mathworks.cube3d.isIE && mathworks.cube3d.browserVersion < 7);
        
        
        mathworks.cube3d.Cube3DColor = {
            GRAY_OPAQUE: {
                supportsAlpha: false,
                se_light: "se_side.gif",
                se_medium: "",
                se_dark: "se_top.gif",
                sw_light: "",
                sw_medium: "sw_side.gif",
                sw_dark: "sw_top.gif",
                ne_light: "ne_side.gif",
                ne_medium: "",
                ne_dark: "ne_top.gif",
                nw_light: "",
                nw_medium: "nw_side.gif",
                nw_dark: "nw_top.gif",
                solid_light: "solid_east.gif",
                solid_medium: "solid_west.gif",
                solid_dark: "solid_top.gif"
            },
            BLACK_ALPHA: {
                supportsAlpha: true,
                se_light: "se_black_20percent.png",
                se_medium: "se_black_36percent.png",
                se_dark: "se_black_48.8percent.png",
                sw_light: "sw_black_20percent.png",
                sw_medium: "sw_black_36percent.png",
                sw_dark: "sw_black_48.8percent.png",
                ne_light: "ne_black_20percent.png",
                ne_medium: "ne_black_36percent.png",
                ne_dark: "ne_black_48.8percent.png",
                nw_light: "nw_black_20percent.png",
                nw_medium: "nw_black_36percent.png",
                nw_dark: "nw_black_48.8percent.png",
                solid_light: "solid_black_20percent.png",
                solid_medium: "solid_black_36percent.png",
                solid_dark: "solid_black_48.8percent.png"
            },
            WHITE_ALPHA: {
                supportsAlpha: true,
                se_light: "se_white_20percent.png",
                se_medium: "se_white_36percent.png",
                se_dark: "se_white_48.8percent.png",
                sw_light: "sw_white_20percent.png",
                sw_medium: "sw_white_36percent.png",
                sw_dark: "sw_white_48.8percent.png",
                ne_light: "ne_white_20percent.png",
                ne_medium: "ne_white_36percent.png",
                ne_dark: "ne_white_48.8percent.png",
                nw_light: "nw_white_20percent.png",
                nw_medium: "nw_white_36percent.png",
                nw_dark: "nw_white_48.8percent.png",
                solid_light: "solid_white_20percent.png",
                solid_medium: "solid_white_36percent.png",
                solid_dark: "solid_white_48.8percent.png"
            }
        };
        
        mathworks.cube3d.Cube3DAspectRatioMode = {
            PRESERVE_WIDTH: {
                transformWidth: function(cubeObject, w){
                    return w;
                },
                transformHeight: function(cubeObject, h){
                    return h * cubeObject.aspectY / cubeObject.aspectX;
                }
            },
            PRESERVE_HEIGHT: {
                transformWidth: function(cubeObject, w){
                    return w * cubeObject.aspectX / cubeObject.aspectY;
                },
                transformHeight: function(cubeObject, h){
                    return h;
                }
            }
        };
        
        mathworks.cube3d.Cube3D = function(containerElement){
            // initialize properties
            this.azimuth = 0;
            this.elevation = 0;
            this.isVisible = false;
            this.originX = 0;
            this.originY = 0;
            this.aspectX = 1;
            this.aspectY = 1;
            this.aspectMode = mathworks.cube3d.Cube3DAspectRatioMode.PRESERVE_WIDTH;
            this.size = 128;
            
            // create HTML elements for the cube display
            function createImg(imgId){
                var elem = document.createElement('img');
                elem.id = imgId;
                elem.style.position = 'absolute';
                elem.style.visibility = 'inherit';
                return elem;
            }
            
            this.cubeElement = document.createElement('div');
            this.cubeElement.style.position = 'absolute';
            this.cubeElement.style.left = '0px';
            this.cubeElement.style.top = '0px';
            this.cubeElement.style.width = '100%';
            this.cubeElement.style.height = '100%';
            this.cubeElement.id = mathworks.util.getNextUniqueId('mathworks_cube3d_');
            
            var cubeImages = {
                right_se1: createImg(this.cubeElement.id + 'right_se1'),
                right_ne1: createImg(this.cubeElement.id + 'right_ne1'),
                right_inside: createImg(this.cubeElement.id + 'right_inside'),
                left_sw2: createImg(this.cubeElement.id + 'left_sw2'),
                left_nw2: createImg(this.cubeElement.id + 'left_nw2'),
                left_inside: createImg(this.cubeElement.id + 'left_inside'),
                top_ne2: createImg(this.cubeElement.id + 'top_ne2'),
                top_ne3: createImg(this.cubeElement.id + 'top_ne3'),
                top_se2: createImg(this.cubeElement.id + 'top_se2'),
                top_se3: createImg(this.cubeElement.id + 'top_se3'),
                top_nw1: createImg(this.cubeElement.id + 'top_nw1'),
                top_nw3: createImg(this.cubeElement.id + 'top_nw3'),
                top_sw1: createImg(this.cubeElement.id + 'top_sw1'),
                top_sw3: createImg(this.cubeElement.id + 'top_sw3'),
                top_inside: createImg(this.cubeElement.id + 'top_inside')
            };
            
            this.cubeElement.appendChild(cubeImages.right_se1);
            this.cubeElement.appendChild(cubeImages.right_ne1);
            this.cubeElement.appendChild(cubeImages.right_inside);
            this.cubeElement.appendChild(cubeImages.left_sw2);
            this.cubeElement.appendChild(cubeImages.left_nw2);
            this.cubeElement.appendChild(cubeImages.left_inside);
            this.cubeElement.appendChild(cubeImages.top_ne2);
            this.cubeElement.appendChild(cubeImages.top_ne3);
            this.cubeElement.appendChild(cubeImages.top_se2);
            this.cubeElement.appendChild(cubeImages.top_se3);
            this.cubeElement.appendChild(cubeImages.top_nw1);
            this.cubeElement.appendChild(cubeImages.top_nw3);
            this.cubeElement.appendChild(cubeImages.top_sw1);
            this.cubeElement.appendChild(cubeImages.top_sw3);
            this.cubeElement.appendChild(cubeImages.top_inside);
            
            containerElement.appendChild(this.cubeElement);
            
            // *************************************************************************
            // Private helper functions
            
            function getImageElement(cubeObject, imgId){
                return cubeImages[imgId];
            }
            
            function setElementPosition(cubeObject, elId, xPos, yPos, elWidth, elHeight){
                var e = getImageElement(cubeObject, elId);
                e.style.left = xPos.toString() + 'px';
                e.style.top = yPos.toString() + 'px';
                e.style.width = elWidth.toString() + 'px';
                e.style.height = elHeight.toString() + 'px';
            }
            
            function hideElement(cubeObject, elId){
                var e = getImageElement(cubeObject, elId);
                e.style.visibility = 'hidden';
            }
            
            function showElement(cubeObject, elId){
                var e = getImageElement(cubeObject, elId);
                e.style.visibility = 'visible';
            }
            
            function refresh(cubeObject){
                if (!cubeObject.isVisible) {
                    return;
                }
                
                var x = [];
                var y = [];
                
                var az = cubeObject.azimuth + 45;
                var el = cubeObject.elevation;
                
                while (az < 0) {
                    az += 360;
                }
                
                while (el < 0) {
                    el += 360;
                }
                
                az = az % 90;
                el = el % 360;
                if (el > 180) {
                    az = 90 - az;
                }
                el = el % 180;
                
                // boxDiagonal = sqrt(2*size^2) = size * sqrt(2)
                var boxDiagonal = cubeObject.size * 1.4142;
                
                var boxHeight = cubeObject.aspectMode.transformHeight(cubeObject, mathworks.fast_trig.fast_sin(el) * boxDiagonal);
                if (boxHeight < 0) {
                    boxHeight = -boxHeight;
                }
                var boxWidth = cubeObject.aspectMode.transformWidth(cubeObject, boxDiagonal);
                
                var maxSideHeight = cubeObject.aspectMode.transformHeight(cubeObject, cubeObject.size);
                
                var sideHeight = parseInt(mathworks.fast_trig.fast_cos(el) * maxSideHeight, 10);
                if (sideHeight < 0) {
                    sideHeight = -sideHeight;
                }
                
                for (var n = 0, a = 0; n < 4; n++, a += 90) {
                    x[n] = parseInt(mathworks.fast_trig.fast_cos(az + a) * boxWidth / 2 + cubeObject.originX, 10);
                    y[n] = parseInt(mathworks.fast_trig.fast_sin(az + a) * boxHeight / 2 + cubeObject.originY -
                    mathworks.fast_trig.fast_cos(el) * maxSideHeight / 2, 10);
                }
                
                var top_sw_visible;
                var top_sw_hidden;
                var top_se_visible;
                var top_se_hidden;
                var top_nw_visible;
                var top_nw_hidden;
                var top_ne_visible;
                var top_ne_hidden;
                
                if (cubeObject.colorScheme.supportsAlpha) {
                    if (el < 90) {
                        top_sw_visible = 'top_sw1';
                        top_sw_hidden = 'top_sw3';
                        
                        top_nw_hidden = 'top_nw1';
                        top_nw_visible = 'top_nw3';
                        
                        top_ne_hidden = 'top_ne2';
                        top_ne_visible = 'top_ne3';
                        
                        top_se_visible = 'top_se2';
                        top_se_hidden = 'top_se3';
                        
                    } else {
                        top_sw_hidden = 'top_sw1';
                        top_sw_visible = 'top_sw3';
                        
                        top_nw_visible = 'top_nw1';
                        top_nw_hidden = 'top_nw3';
                        
                        top_ne_visible = 'top_ne2';
                        top_ne_hidden = 'top_ne3';
                        
                        top_se_hidden = 'top_se2';
                        top_se_visible = 'top_se3';
                    }
                } else {
                    top_sw_visible = 'top_sw3';
                    top_nw_visible = 'top_nw3';
                    top_se_visible = 'top_se3';
                    top_ne_visible = 'top_ne3';
                    
                    top_sw_hidden = 'top_sw1';
                    top_nw_hidden = 'top_nw1';
                    top_se_hidden = 'top_se2';
                    top_ne_hidden = 'top_ne2';
                }
                
                // draw top/bottom
                if (az <= 45) {
                    setElementPosition(cubeObject, top_ne_visible, x[1], y[1], x[0] - x[1], y[0] - y[1]);
                    setElementPosition(cubeObject, top_se_visible, x[3], y[0], x[0] - x[3], y[3] - y[0]);
                    setElementPosition(cubeObject, top_sw_visible, x[2], y[2], x[3] - x[2], y[3] - y[2]);
                    setElementPosition(cubeObject, top_nw_visible, x[2], y[1], x[1] - x[2], y[2] - y[1]);
                    setElementPosition(cubeObject, 'top_inside', x[1], y[0], x[3] - x[1], y[2] - y[0]);
                } else {
                    setElementPosition(cubeObject, top_ne_visible, x[0], y[0], x[3] - x[0], y[3] - y[0]);
                    setElementPosition(cubeObject, top_se_visible, x[2], y[3], x[3] - x[2], y[2] - y[3]);
                    setElementPosition(cubeObject, top_sw_visible, x[1], y[1], x[2] - x[1], y[2] - y[1]);
                    setElementPosition(cubeObject, top_nw_visible, x[1], y[0], x[0] - x[1], y[1] - y[0]);
                    setElementPosition(cubeObject, 'top_inside', x[2], y[1], x[0] - x[2], y[3] - y[1]);
                }
                
                showElement(cubeObject, top_sw_visible);
                showElement(cubeObject, top_se_visible);
                showElement(cubeObject, top_nw_visible);
                showElement(cubeObject, top_ne_visible);
                
                hideElement(cubeObject, top_sw_hidden);
                hideElement(cubeObject, top_se_hidden);
                hideElement(cubeObject, top_nw_hidden);
                hideElement(cubeObject, top_ne_hidden);
                
                // draw right side
                if (az > 45) {
                    if (el < 90) {
                        showElement(cubeObject, 'right_se1');
                        hideElement(cubeObject, 'right_ne1');
                        setElementPosition(cubeObject, 'right_se1', x[2], y[3] + sideHeight, x[3] - x[2], y[2] - y[3]);
                        setElementPosition(cubeObject, 'right_inside', x[2], y[3], x[3] - x[2], sideHeight);
                    } else {
                        hideElement(cubeObject, 'right_se1');
                        showElement(cubeObject, 'right_ne1');
                        setElementPosition(cubeObject, 'right_ne1', x[0], y[0] - sideHeight, x[3] - x[0], y[3] - y[0]);
                        setElementPosition(cubeObject, 'right_inside', x[0], y[3] - sideHeight, x[3] - x[0], sideHeight);
                    }
                } else {
                    if (el < 90) {
                        showElement(cubeObject, 'right_se1');
                        hideElement(cubeObject, 'right_ne1');
                        setElementPosition(cubeObject, 'right_se1', x[3], y[0] + sideHeight, x[0] - x[3], y[3] - y[0]);
                        setElementPosition(cubeObject, 'right_inside', x[3], y[0], x[0] - x[3], sideHeight);
                    } else {
                        hideElement(cubeObject, 'right_se1');
                        showElement(cubeObject, 'right_ne1');
                        setElementPosition(cubeObject, 'right_ne1', x[1], y[1] - sideHeight, x[0] - x[1], y[0] - y[1]);
                        setElementPosition(cubeObject, 'right_inside', x[1], y[0] - sideHeight, x[0] - x[1], sideHeight);
                    }
                }
                
                // draw left side
                if (az > 45) {
                    if (el < 90) {
                        showElement(cubeObject, 'left_sw2');
                        hideElement(cubeObject, 'left_nw2');
                        setElementPosition(cubeObject, 'left_sw2', x[1], y[1] + sideHeight, x[2] - x[1], y[2] - y[1]);
                        setElementPosition(cubeObject, 'left_inside', x[1], y[1], x[2] - x[1], sideHeight);
                    } else {
                        hideElement(cubeObject, 'left_sw2');
                        showElement(cubeObject, 'left_nw2');
                        setElementPosition(cubeObject, 'left_nw2', x[1], y[0] - sideHeight, x[0] - x[1], y[1] - y[0]);
                        setElementPosition(cubeObject, 'left_inside', x[1], y[1] - sideHeight, x[0] - x[1], sideHeight);
                    }
                } else {
                    if (el < 90) {
                        hideElement(cubeObject, 'left_nw2');
                        showElement(cubeObject, 'left_sw2');
                        setElementPosition(cubeObject, 'left_sw2', x[2], y[2] + sideHeight, x[3] - x[2], y[3] - y[2]);
                        setElementPosition(cubeObject, 'left_inside', x[2], y[2], x[3] - x[2], sideHeight);
                    } else {
                        hideElement(cubeObject, 'left_sw2');
                        showElement(cubeObject, 'left_nw2');
                        setElementPosition(cubeObject, 'left_nw2', x[2], y[1] - sideHeight, x[1] - x[2], y[2] - y[1]);
                        setElementPosition(cubeObject, 'left_inside', x[2], y[2] - sideHeight, x[1] - x[2], sideHeight);
                    }
                }
            }
            
            function setImageSrc(cubeObject, imgId, imgFile){
                var e = getImageElement(cubeObject, imgId);
                e.src = context.loader.getResource(moduleDir + '/images/' + imgFile);				
            }
            
            /**
             * Sets the cube's color scheme.
             *
             * @param scheme one of: Cube3DColor.GRAY_OPAQUE, Cube3DColor.BLACK_ALPHA, or Cube3DColor.WHITE_ALPHA
             *
             * @return nothing
             */
            this.setColor = function(scheme){
                this.colorScheme = scheme;
                if (scheme.supportsAlpha) {
                    setImageSrc(this, 'top_se2', scheme.se_medium);
                    setImageSrc(this, 'top_sw1', scheme.sw_light);
                    setImageSrc(this, 'top_ne2', scheme.ne_medium);
                    setImageSrc(this, 'top_nw1', scheme.nw_light);
                }
                setImageSrc(this, 'right_se1', scheme.se_light);
                setImageSrc(this, 'right_ne1', scheme.ne_light);
                setImageSrc(this, 'right_inside', scheme.solid_light);
                setImageSrc(this, 'left_sw2', scheme.sw_medium);
                setImageSrc(this, 'left_nw2', scheme.nw_medium);
                setImageSrc(this, 'left_inside', scheme.solid_medium);
                setImageSrc(this, 'top_ne3', scheme.ne_dark);
                setImageSrc(this, 'top_se3', scheme.se_dark);
                setImageSrc(this, 'top_nw3', scheme.nw_dark);
                setImageSrc(this, 'top_sw3', scheme.sw_dark);
                setImageSrc(this, 'top_inside', scheme.solid_dark);
                refresh(this);
            };
            
            /**
             * Sets the cube's current position.
             *
             * @param atX The x coordinate of the cube's center
             * @param atY The y coordinate of the cube's center
             *
             * @return nothing
             */
            this.setPosition = function(atX, atY){
                this.originX = atX;
                this.originY = atY;
                refresh(this);
            };
            
            /**
             * Sets the aspect ratio used to the display the cube to w:h.
             *
             * @param w The horizontal component of the new aspect ratio
             * @param h The vertical component of the new aspect ratio
             *
             * @return nothing
             */
            this.setAspectRatio = function(w, h){
                if (w === h && 0 === w) {
                    w = 1;
                    h = 1;
                }
                this.aspectX = w;
                this.aspectY = h;
                refresh(this);
            };
            
            /**
             * Sets the mode used to convert size + aspect ratio to the actual
             * dimensions of the rendered cube.
             *
             * @param mode One of: Cube3DAspectRatioMode.PRESERVE_WIDTH or
             *                     Cube3DAspectRatioMode.PRESERVE_HEIGHT
             *
             * @return nothing
             */
            this.setAspectRatioMode = function(mode){
                this.aspectMode = mode;
                refresh(this);
            };
            
            /**
             * Sets the tilt angle of the cube.
             *
             * @param az The azimuth angle in degrees
             * @param el The elevation angle in degrees
             *
             * @return nothing
             */
            this.setAngle = function(az, el){
                this.azimuth = az;
                this.elevation = el;
                refresh(this);
            };
            
            /**
             * Sets the size (in pixels) of each side of the cube.
             */
            this.setSize = function(newSize){
                this.size = newSize;
                refresh(this);
            };
            
            /**
             * Sets the width/height of straight-on view of the cube.
             */
            this.setDims = function(w, h){
                this.size = w;
                this.aspectMode = mathworks.cube3d.Cube3DAspectRatioMode.PRESERVE_WIDTH;
                this.aspectX = w;
                this.aspectY = h;
                refresh(this);
            };
            
            /**
             * Shows the cube at the current position.
             *
             * @return nothing
             */
            this.show = function(){
                this.cubeElement.style.display = 'block';
                this.isVisible = true;
                refresh(this);
            };
            
            /**
             * Hides the cube from the page display.
             *
             * @return nothing
             */
            this.hide = function(){
                this.cubeElement.style.display = 'none';
                this.isVisible = false;
            };
            
            // hide the cube
            this.hide();
            
            // default to black alpha color scheme if alpha is supported
            if (mathworks.cube3d.useAlpha) {
                this.setColor(mathworks.cube3d.Cube3DColor.BLACK_ALPHA);
            } else {
                this.setColor(mathworks.cube3d.Cube3DColor.GRAY_OPAQUE);
            }
        };
    }
});
