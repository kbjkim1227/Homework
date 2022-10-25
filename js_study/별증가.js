function printTriangle(height) {
  let a = '';
  for (let i = 0; i < height; i++) {
    a += '*';
    console.log(a);
  }
}

// 테스트 코드
console.log("높이: 1");
printTriangle(1);

console.log("높이: 3");
printTriangle(3);

console.log("높이: 5");
printTriangle(5);
