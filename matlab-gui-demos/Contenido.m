%% Desarrollo de GUIs en MATLAB(R), curso práctico.
% Esta colección de interfaces gráficas forma parte del proyecto MATLAB
% TYP, cuyo propósito general es compartir información acerca del uso del
% software MATLAB(R), así como facilitar material escrito y/o audiovisual que
% resulte de interés para los usuarios hispanohablantes.
% 
%
% 
% Esta versión ha sido escrita priorizando la legibilidad del código y
% dejando en un segundo plano características que serían importantes en un
% desarrollo de software profesional. Dados los fines académicos de esta
% colección de GUIs es posible que encuentre alternativas mejores a las
% propuestas aquí, siendo así y si lo considera oportuno, el autor
% agradecería cualquier sugerencia o comentario respecto a cualquier
% porción de código que conforma este proyecto.
% 
%
% *Versión:* 0.0.1
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
% Se muestran las propiedades elementales de una etiqueta de texto estático
% tales como el 'string', la posición, características de la fuente, etc...

%% |g03_DemoButton.m|
% Esta GUI contiene un botón (Push Button) que al ser presionado modifica
% su color de fondo |('BackgroundColor')| de manera aleatoria, al igual que
% lo hace con el color de fuente |('ForegroundColor')|
%

%% |g04_DemoEditText.m|
%
% Muestra las propiedades básicas de un campo de texto editable, haciendo
% enfásis precisamente en la "posibilidad" de modificar el contenido de
% esta.
%
%% |g05_DemoAxes.m|
%
% Proporciona un ejemplo de cómo posicionar axes y modificar sus
% propiedades, además se tiene como ejemplo la representación gráfica de
% funciones dentro de dichos elementos, utilizando la función plot y
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
% cell array. Además de ejemplificarse como obtener el valor seleccionado
% de la lista contenida en el listbox y el uso de un msgbox para mostrar
% información o un mensaje mediante un interfaz gráfica.
%
%
%% |g08_DemoSlider.m|
% En esta interfaz gráfica se muestra el uso de un slider. El valor
% obtenido del slider modifica el color de la ventana, en una variación
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
% seleccionar solamente una opción. En este caso se modifica el tipo de
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

