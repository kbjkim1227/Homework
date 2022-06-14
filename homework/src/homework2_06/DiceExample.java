package homework2_06;

public class DiceExample {

    public static void main(String[] args) {
	Dice.AddDice();
	Dice.MultiDice(); //전역 메서드
		
	Dice dice = new Dice();
	dice.AddnDice();
	dice.MultinDice(); //멤버 메서드
    }
}


