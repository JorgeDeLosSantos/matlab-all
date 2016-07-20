// Tile map implementation compatible with ViewManager system

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

    name: "mathworks/tilemap/tilemap.jsm",
    
    definition: function(context){
        if (!mathworks.tilemap) {
            mathworks.tilemap = {
                create: function(numRows, numCols, initSrc){
                    var htmlSource = "<table border='0' cellspacing='0' cellpadding='0' width='100%' height='100%>'";
                    var vPercentRemaining = 100;
                    for (var r = 0; r < numRows; ++r) {
                        var percentThisRow = parseInt(vPercentRemaining / (numRows - r) + 0.1, 10);
                        vPercentRemaining -= percentThisRow;
                        htmlSource += "<tr height='" + percentThisRow + "%'>";
                        var hPercentRemaining = 100;
                        for (var c = 0; c < numCols; ++c) {
                            var percentThisCol = parseInt(hPercentRemaining / (numCols - c) + 0.1, 10);
                            hPercentRemaining -= percentThisCol;
                            htmlSource += "<td width='" + percentThisCol + "%'>";
                            htmlSource += "<div style='position:relative;width:100%;height:100%;'>";
                            htmlSource += "<img src='" + initSrc + "' style='position:absolute;width:100%;height:100%;'>";
                            htmlSource += "</div></td>";
                        }
                        htmlSource += "</tr>";
                    }
                    htmlSource += "</table>";
                    
                    var tileMap = document.createElement('div');
                    tileMap.innerHTML = htmlSource;
                    tileMap.numCols = numCols;
                    tileMap.numRows = numRows;
                    
                    tileMap.getTile = function(r, c){
                        var myTable = this.firstChild;
                        var myTbody = myTable.firstChild;
                        var myRow = myTbody.childNodes[r];
                        var myCell = myRow.childNodes[c];
                        var myDiv = myCell.firstChild;
                        var myImg = myDiv.firstChild;
                        return myImg;
                    };
                    
                    tileMap.reveal = function(clipRect){
                    };
                    
                    return tileMap;
                }
            };
        }
    }
});
