# -*- coding: cp1252 -*-
from random import random
from numpy import array,zeros
f=open('archivo.txt','w')
nf=nc=300
X=zeros((nf,nc))
for i in range(nf):
    for j in range(nc):
	    f.write(str(random()*255)+"\t")
    f.write("\n")
f.close()