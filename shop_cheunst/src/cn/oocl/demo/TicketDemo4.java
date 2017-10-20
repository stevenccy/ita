package cn.oocl.demo;

// 通過代碼演示線程安全問題
public class TicketDemo4 implements Runnable {

	private int num = 30; // 默認有30張單據

	@Override
	// 需要加鎖
	public void run() {
		while (num > 0) {
			synchronized (TicketDemo4.class) {
				if (num > 0) {
					// 獲取當前線程的名稱
					String tName = Thread.currentThread().getName();
					System.out.println(tName + "正在出售" + num + "張票");

					try {
						Thread.sleep(100);
					} catch (InterruptedException e) {
						throw new RuntimeException(e);
					}
					num--;
				}
			}
		}
	}

	public static void main(String[] args) { // main在啟動是主線程
		TicketDemo4 demo3 = new TicketDemo4();
		new Thread(demo3).start();
		new Thread(demo3).start();
		new Thread(demo3).start();
	}

}