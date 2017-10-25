package cn.oocl.demo;

public class ThreadLocalDemo {
	private ThreadLocal<String> st = new ThreadLocal<String>();
	private ThreadLocal <Long> lt = new ThreadLocal<Long>();
	
	public void setVal(){
		Thread t = Thread.currentThread();
		st.set(t.getName());
		lt.set(t.getId());
	}
	public void getVal(){
		System.out.println(st.get());
		System.out.print(lt.get());
	}
	
	public static void main (String[] args) throws InterruptedException{
		final ThreadLocalDemo demo = new ThreadLocalDemo();
		demo.setVal();
		demo.getVal();
		new Thread(){
			@Override
			public void run(){
				demo.setVal();
				demo.getVal();
			}
		}.start();
		Thread.sleep(1000);
		demo.getVal();
	}
}
