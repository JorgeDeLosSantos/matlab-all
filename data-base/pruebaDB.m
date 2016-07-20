clear all;clc;
conn=database('inventarios','root','1304912511');
curs=exec(conn,['SELECT * FROM clientes']);
curs=fetch(curs);
close(curs);
datos=curs.Data;
close(conn);
clear conn curs
