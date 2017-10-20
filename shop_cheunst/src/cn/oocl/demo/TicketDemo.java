package cn.oocl.demo;

// 通過代碼演示線程安全問題
public class TicketDemo extends Thread {
	
	private int num =30; // 默認有30張單據

	@Override
	public void run() {
		while(num > 0) {
			//獲取當前線程的名稱
			String tName = Thread.currentThread().getName();
			System.out.println(tName + "正在出售" + num + "張票");
			num--;
		}
	}

	public static void main(String[] args) { // main在啟動是主線程
		TicketDemo demo1 = new TicketDemo();
	//	demo1.run();  //此方式
		TicketDemo demo2 = new TicketDemo();
		demo2.start();
		TicketDemo demo3 = new TicketDemo();
		demo3.run();
	}
	

}
