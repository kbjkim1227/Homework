// function checkHeight(height) {
//   if (height >= 140) {
//     console.log("탑승이 가능합니다.");
//   } else {
//     console.log("탑승이 불가능합니다.");
//   }
// }
function checkHeight(height) {
  const LIMIT = 140;
  let pass = "탑승이 가능합니다.";
  let fail = "탑승이 불가능합니다.";
  if (height >= LIMIT) {
    console.log(pass);
  } else {
    console.log(fail);
  }
}
checkHeight(140);
checkHeight(135);
checkHeight(170);
