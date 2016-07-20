#! -*- coding: cp1252 -*-
# Función
import random

A=random.randint(0,100)
n=1

print(A)

while True:
    B=input("Inserte el número: ")
    if A==B:
        print("Número encontrado")
        break
    print("Siga intentando")
    n=n+1

print("Número encontrado en ",n," intentos")
raw_input('')
