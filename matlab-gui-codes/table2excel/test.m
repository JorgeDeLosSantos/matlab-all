clear;clc;
DM = {
    'Mario',10;
    'Nancy',7;
    'Sandra',8;
    'Jorge',9;
    'Ana',10
    };
CN = {'NAME','SCORE'};
h = uitable('Data',DM,'ColumnName',CN);

%table2xls(h,'Example_01.xlsx',1,'A1');