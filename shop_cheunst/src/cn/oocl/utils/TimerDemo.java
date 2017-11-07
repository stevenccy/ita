package cn.oocl.utils;

import java.util.Timer;
import java.util.TimerTask;

public class TimerDemo {
	
	public static void main (String[]args) throws InterruptedException{
		System.out.println(Thread.currentThread().getName());
		new Timer (true).schedule(new TimerTask(){

			@Override
			public void run() {
				System.out.println(Thread.currentThread().getName());
				System.out.println("run......");
			}
			
		},4000,2000);
		Thread.sleep(5000);
	}
}
