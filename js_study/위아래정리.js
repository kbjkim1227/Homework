// 나의 나이와, 나의 성별을 저장하는 변수
let myAge = 26;
let myGender = "male";

// 호칭을 담은 변수
let callOlderBrother = "형";
let callOlderSister = "누나";
let callFriend = "친구";
let callYoungerSister = "여동생";
let callYoungerBrother = "남동생";

// 상대방의 나이와 성별에 따른 호칭을 리턴하는 함수 whatShouldICall를 완성하세요.
function whatShouldICallYou(yourAge, yourGender) {
  if (myAge === yourAge) { //나이가 같은경우
    return callFriend; 
  } else if (myAge > yourAge) { //어린경우
    if (yourGender === "male") { //어린경우 남자
      return callYoungerBrother;
    } else if (yourGender == "female") {//어린경우 여자
      return callYoungerSister;
    }
  } else { //그외 (많은 경우)
    if (yourGender === "male") {// 남자
      return callOlderBrother;
    } else if (yourGender === "female") { // 여자
      return callOlderSister;
    }
  }
  
}
// 여기에 코드를 작성해 주세요.

// 테스트 코드
let result1 = whatShouldICallYou(25, "female"); //여동생
let result2 = whatShouldICallYou(20, "male"); //냠동생
let result3 = whatShouldICallYou(26, "female"); //친구
let result4 = whatShouldICallYou(30, "male"); //형
let result5 = whatShouldICallYou(31, "female"); //누나

console.log(result1);
console.log(result2);
console.log(result3);
console.log(result4);
console.log(result5);





//https://github.com/JOSuYeoM/Web-Study/blob/ee51d60dd9634211cb636ffb4a4a09da61dfd91d/JavaScript/CodeIt/%EC%84%9C%EC%97%B4%EC%A0%95%EB%A6%AC.js