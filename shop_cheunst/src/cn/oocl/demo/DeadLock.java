package cn.oocl.demo;

// 通過代碼演示線程安全問題本質：線程之間的互斥
public class DeadLock {

	public static void main(String[] args) { // main在啟動是主線程
		new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					synchronized ("刀") {
						String tName = Thread.currentThread().getName();
						System.out.println("線程" + tName + "獲取了刀資源");
						synchronized ("fork") {
							tName = Thread.currentThread().getName();
							System.out.println("線程" + tName + "獲取了fork資源");
							System.out.println(tName + " Having Lunch");

							Thread.sleep(1000);

						}
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}

		}, "T1").start();

		new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					synchronized ("刀") {
						String tName = Thread.currentThread().getName();
						System.out.println("線程" + tName + "獲取了刀資源");
						Thread.sleep(300);
						synchronized ("fork") {
							tName = Thread.currentThread().getName();
							System.out.println("線程" + tName + "獲取了fork資源");
							System.out.println(tName + " Having Lunch");

							Thread.sleep(1000);

						}
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}

		}, "T2").start();
		new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					synchronized ("刀") {
						String tName = Thread.currentThread().getName();
						System.out.println("線程" + tName + "獲取了刀資源");
						synchronized ("fork") {
							tName = Thread.currentThread().getName();
							System.out.println("線程" + tName + "獲取了fork資源");
							System.out.println(tName + " Having Lunch");

							Thread.sleep(1000);

						}
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}

		}, "T3").start();
	}
}