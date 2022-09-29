package homework1_14.HumanArray;
// 사람 클래스(ver.1)
class Human {
	String name;	//이름
	int height;		//신장
	int weight;		//체중
	
	// --- 생성자 ---//
	Human(String n, int h, int w){
		name = n; height = h; weight = w;
	}
	
	String getName() { return name; }
	int getHeight() { return height; }
	int getWeight() { return weight; }
	
	void gainWeight(int w) {weight += w;}
	void reduceWeight(int w) {weight -= w;}
	
	
}
