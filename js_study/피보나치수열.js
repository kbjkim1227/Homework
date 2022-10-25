
let current = 1;
let previous = 0;

for (let i = 0; i <= 10; i++) {
    console.log(current);// previous와 currrent를 정절히 수정
    // current = current + previous;
    let temp = previous; // previous를 임시 보관소 temp에 저장
    previous = current;
    current = current + temp; //temp에는 기존 previous 값이 저장되어 있음.

    
}