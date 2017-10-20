package cn.oocl.demo;

// 通過代碼演示線程安全問題
public class TicketDemo3 implements Runnable {
	
	private int num =30; // 默認有30張單據

	@Override
	public void run() {
		while(num > 0) {
			//獲取當前線程的名稱
			String tName = Thread.currentThread().getName();
			System.out.println(tName + "正在出售" + num + "張票");

			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				throw new RuntimeException(e);
			}
			
			num--;
		}
	}

	public static void main(String[] args) { // main在啟動是主線程
		TicketDemo3 demo3 = new TicketDemo3();
		new Thread(demo3).start();
		new Thread(demo3).start();
		new Thread(demo3).start();
	}
	

}
