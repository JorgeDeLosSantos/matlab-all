%% Desarrollo de GUIs en MATLAB(R), curso pr�ctico.
% Esta colecci�n de interfaces gr�ficas forma parte del proyecto MATLAB
% TYP, cuyo prop�sito general es compartir informaci�n acerca del uso del
% software MATLAB(R), as� como facilitar material escrito y/o audiovisual que
% resulte de inter�s para los usuarios hispanohablantes.
% 
%
% 
% Esta versi�n ha sido escrita priorizando la legibilidad del c�digo y
% dejando en un segundo plano caracter�sticas que ser�an importantes en un
% desarrollo de software profesional. Dados los fines acad�micos de esta
% colecci�n de GUIs es posible que encuentre alternativas mejores a las
% propuestas aqu�, siendo as� y si lo considera oportuno, el autor
% agradecer�a cualquier sugerencia o comentario respecto a cualquier
% porci�n de c�digo que conforma este proyecto.
% 
%
% *Versi�n:* 0.0.1
%
% *Licencia:*  GNU/GPL
%
% *Fecha:* 01/11/2014
%
% *Desarrollador:* Jorge De Los Santos
%
% *E-mail:* delossantosmfq@gmail.com     |    matlabtyp@gmail.com
%
% *Blog:* http://matlab-typ.blogspot.mx
%
%
%% |g01_DemoFigure.m|
% Este primer ejemplo muestra como crear una ventana utilizando el
% elemento figure.

%% |g02_DemoStaticText.m|
% Se muestran las propiedades elementales de una etiqueta de texto est�tico
% tales como el 'string', la posici�n, caracter�sticas de la fuente, etc...

%% |g03_DemoButton.m|
% Esta GUI contiene un bot�n (Push Button) que al ser presionado modifica
% su color de fondo |('BackgroundColor')| de manera aleatoria, al igual que
% lo hace con el color de fuente |('ForegroundColor')|
%

%% |g04_DemoEditText.m|
%
% Muestra las propiedades b�sicas de un campo de texto editable, haciendo
% enf�sis precisamente en la "posibilidad" de modificar el contenido de
% esta.
%
%% |g05_DemoAxes.m|
%
% Proporciona un ejemplo de c�mo posicionar axes y modificar sus
% propiedades, adem�s se tiene como ejemplo la representaci�n gr�fica de
% funciones dentro de dichos elementos, utilizando la funci�n plot y
% pasando como argumento la referencia (handle) del axes en el que debe
% mostrarse.
% 
%% |g06_DemoPopUpMenu.m|
% 
% Permite cambiar el color de fondo de la ventana |('figure')| utilizando
% una lista de colores almacenada en un Pop-up-menu
%
%% |g07_DemoListBox.m|
% Muestra como configurar el string de un listbox mediante el uso de un
% cell array. Adem�s de ejemplificarse como obtener el valor seleccionado
% de la lista contenida en el listbox y el uso de un msgbox para mostrar
% informaci�n o un mensaje mediante un interfaz gr�fica.
%
%
%% |g08_DemoSlider.m|
% En esta interfaz gr�fica se muestra el uso de un slider. El valor
% obtenido del slider modifica el color de la ventana, en una variaci�n
% desde negro a blanco, pasando por las diversas tonalidades de grises.
% 
%
%% |g09_DemoCheckBox.m|
% El checkbox contenido en esta GUI permite controlar si la ventana es
% redimensionable, lo anterior modificando la propiedad 'resize'.
%
%
%% |g10_DemoRadioButtons|
% Ejemplifica el uso de radio buttons dentro de un uibuttongroup para
% seleccionar solamente una opci�n. En este caso se modifica el tipo de
% fuente en los 'strings' de los radio buttons.
%
%
%% |g11_DemoMenu.m|
%
%
%
%% |g12_HolaMundo.m|
%% |g13_IntegraDeriva.m|
%% |g14_MiniCalculadora.m|
%% |g15_EditableListBox.m|
%% |g16_ConversorLongitudes.m|
%% |g17_Graficador.m|
%% |g18_VisorImagenes.m|
%% |g19_ImagenFondo.m|
%% |g20_ColorRGB.m|

