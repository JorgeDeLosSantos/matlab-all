public class testHilo{
	
	public static void main(String[] args){
		Thread h1 = new Thread(new hilo());
		h1.start();
	}
}
