import com.mathworks.toolbox.javabuilder.*;
import Ejemplo.Class1;

public class MiClase{
	public static void main(String[] args){	
		Class1 cl = new Class1();
		cl.HolaMundo(1);
		
		if (cl != null){
			cl.dispose();
		}
	}
}
