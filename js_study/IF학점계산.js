function printGrade(midtermScore, finalScore) {
  let totalScore = midtermScore + finalScore;
  if (totalScore >= 90) {
    console.log("A");
  } else if (totalScore >= 90) {
    console.log("B");
  } else if (totalScore >= 80) {
    console.log("C");
  } else if (totalScore >= 70) {
    console.log("D");
  } else if (totalScore >= 60) {
    console.log("F");
  }
}

// 테스트 코드
printGrade(25, 35);
printGrade(50, 45);
printGrade(29, 24);
printGrade(37, 42);
//a 90점이상 b 80~90 c 70~80 d 60~70 f 60미만
