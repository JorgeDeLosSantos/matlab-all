pack Hilo;

public class hilo implements Runnable{
	public hilo(){
	}
	public void run(){
		int x;
		x = 0;
		while (x<1000)
		{
			System.out.println(x);
			x++;
		}
	}
}
