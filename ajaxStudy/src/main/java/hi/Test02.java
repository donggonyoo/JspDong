package hi;
public class Test02 {
	public int sumVal(int x, int sum) {
		int total=0;
		switch (x) {
		case 0 ->{
				for (int i =1; i <= sum; i++) {
					total+= i;
				}
				return total;
			}
		case 1->{
			for (int i =1; i <= sum; i++) {
				if(i%2==0) { //짝수
					total+= i;
				}
			}
			return total;
		}
		case 2->{
			for (int i =1; i <= sum; i++) {
				if(i%2==1) { //홀스
					total+= i;
				}
			}
			return total;
		}
		
		}
		return total;
	}

}
