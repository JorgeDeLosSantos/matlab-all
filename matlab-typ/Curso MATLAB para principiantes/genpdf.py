import os

try:
	os.system('rst2pdf CursoMPP.txt -o Curso.pdf -s src/estilo.txt')
except:
	print "Archivo no encontrado"

os.startfile('Curso.pdf')
#os.system('pause')