package model.adder;

public class Adder {
	String fruit;
	int num;
	public String getFruit() {
		return fruit;
	}
	public void setFruit(String fruit) {
		this.fruit = fruit;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return fruit + "" + num + "개 보유";
	}
	
	
}
