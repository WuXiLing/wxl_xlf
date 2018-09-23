package avic.apache.eureka.common;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

public class CommonRandomUtils {

	public static String getRandomString() {
		return getRandomString(1024*20);
	}

	private static String getRandomString(int length) {
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(62);
			sb.append(str.charAt(number));
		}
		return sb.toString();
	}

	public static User getRandomObject() {
		return new User(getRandomString(10), new Random().nextLong(), getRandomString(10), getRandomString(10),
				getRandomString(10), getRandomString(10), getRandomString(10), getRandomString(10), getRandomString(10),
				getRandomString(10), getRandomString(10), getRandomString(10), getRandomString(10), getRandomString(10),
				getRandomString(10), getRandomString(10), getRandomString(10), getRandomString(10),
				Calendar.getInstance().getTime(), Calendar.getInstance().getTime());
	}

	public static List<User> getRandomList() {
		return getRandomList(50);
	}

	private static List<User> getRandomList(final int length) {
		final Random random = new Random();
		List<User> l = new ArrayList<User>() {
			private static final long serialVersionUID = 339440093925149585L;

			{
				int i = length;
				for (; i > 0; i--) {
					add(new User(getRandomString(10), random.nextLong(), getRandomString(10), getRandomString(10),
							getRandomString(10), getRandomString(10), getRandomString(10), getRandomString(10),
							getRandomString(10), getRandomString(10), getRandomString(10), getRandomString(10),
							getRandomString(10), getRandomString(10), getRandomString(10), getRandomString(10),
							getRandomString(10), getRandomString(10), Calendar.getInstance().getTime(),
							Calendar.getInstance().getTime()));
				}
			}
		};
		return l;
	}
}
