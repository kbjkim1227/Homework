let player1 = [];
let player2 = [];
let turn = 1;
let board = [
  //오목판
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""],
];
getboard();

//게임을 재시작합니다.
function restart() {
  location.reload();
}
//오목판을 만들어줍니다.
function getboard() {
  let html = "<table>";
  for (let i = 0; i < 15; i++) {
    html += "<tr>";
    for (let j = 0; j < 15; j++) {
      let ji = j + "," + i;
      let p1check = false;
      let p2check = false;
      for (let a = 0; a < player1.length; a++) {
        if (player1[a] == ji) {
          p1check = true;
        }
      }
      for (let a = 0; a < player2.length; a++) {
        if (player2[a] == ji) {
          p2check = true;
        }
      }

      if (p1check) {
        html += "<td>O</td>";
      } else if (p2check) {
        html += "<td>X</td>";
      } else {
        html += '<td onclick="boardclick(' + j + "," + i + ')"></td>';
      }
    }
    html += "</tr>";
  }
  html += "</table>";
  document.getElementById("omokboard").innerHTML = html;
}

let winner = "";
let gameend = false;
//클릭에 대한 함수
function boardclick(x, y) {
  if (gameend) {
    alert("재시작을 눌러주세요.");
  } else {
    let xy = x + "," + y;
    if (turn == 1) {
      player1.push(xy); // o 체크
      board[x][y] = "O"; // o 체크
      turn = 2;
      document.getElementById("truncheck").innerHTML = "player2 차례입니다.";
      p2.style.cssText = "background-color: red"; // 순서에 맞게 백그라운드 칼라 변경
      p1.style.cssText = "background-color: white";
    } else {
      player2.push(xy); // x 체크
      board[x][y] = "X"; // x 체크
      turn = 1;
      document.getElementById("truncheck").innerHTML = "player1 차례입니다.";
      p1.style.cssText = "background-color: red";
      p2.style.cssText = "background-color: white";
    }
    console.log(player1);
    console.log(player2);
    console.log(board);
    getboard();

    for (let i = 2; i < 13; i++) {
      for (let j = 0; j < 15; j++) {
        // 세로방향의 승리 함수
        if (
          board[j][i - 2] == board[j][i] &&
          board[j][i - 1] == board[j][i] &&
          board[j][i + 1] == board[j][i] &&
          board[j][i + 2] == board[j][i] &&
          board[j][i] != ""//6목 아닐때
        ) {
          if (board[j][i] == "O") {
            winner = "player1";
          } else if (board[j][i] == "X") {
            winner = "player2";
          }
        }
        // 가로방향의 승리 함수
        if (
          board[i - 2][j] == board[i][j] &&
          board[i - 1][j] == board[i][j] &&
          board[i + 1][j] == board[i][j] &&
          board[i + 2][j] == board[i][j] &&
          board[i][j] != ""
        ) {
          if (board[i][j] == "O") {
            winner = "player1";
          } else if (board[i][j] == "X") {
            winner = "player2";
          }
        }
      }
    }
    //대각선방향의 승리 함수
    for (let i = 2; i < 13; i++) {
      for (let j = 2; j < 13; j++) {
        if (
          board[j - 2][i - 2] == board[j][i] &&
          board[j - 1][i - 1] == board[j][i] &&
          board[j + 1][i + 1] == board[j][i] &&
          board[j + 2][i + 2] == board[j][i] &&
          board[j][i] != ""
        ) {
          if (board[j][i] == "O") {
            winner = "player1";
          } else if (board[j][i] == "X") {
            winner = "player2";
          }
        }
        //반대 대각선방향의 승리 함수
        if (
          board[j + 2][i - 2] == board[j][i] &&
          board[j + 1][i - 1] == board[j][i] &&
          board[j - 1][i + 1] == board[j][i] &&
          board[j - 2][i + 2] == board[j][i] &&
          board[j][i] != ""
        ) {
          if (board[j][i] == "O") {
            winner = "player1";
          } else if (board[j][i] == "X") {
            winner = "player2";
          }
        }
      }
    }

    if (winner != "") {
      document.getElementById("truncheck").innerHTML =
        "!!!!!"+winner + "플레이어가 승리하였습니다!!!!!";
      //winner가 출력됩니다.
      gameend = true;
    }
  }
}
