#! -*- coding: cp1252 -*-
# Funci�n
import random

A=random.randint(0,100)
n=1

print(A)

while True:
    B=input("Inserte el n�mero: ")
    if A==B:
        print("N�mero encontrado")
        break
    print("Siga intentando")
    n=n+1

print("N�mero encontrado en ",n," intentos")
raw_input('')
