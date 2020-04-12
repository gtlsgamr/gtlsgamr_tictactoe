import 'package:tictactoe/button_class.dart';


var butts;
var currPlayer = 1;
var winner;
var winCombos = <List>[
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
];
var buttonList = <XoButton>[
  XoButton(1),
  XoButton(2),
  XoButton(3),
  XoButton(4),
  XoButton(5),
  XoButton(6),
  XoButton(7),
  XoButton(8),
  XoButton(9),
];



resetBoard() {
  
  
  buttonList = <XoButton>[
    XoButton(1),
    XoButton(2),
    XoButton(3),
    XoButton(4),
    XoButton(5),
    XoButton(6),
    XoButton(7),
    XoButton(8),
    XoButton(9),
  ];
  currPlayer = 1;
  winner = 0;
}



checkTest(a, b, c, z) {
  if (z == 1) {
    if (buttonList[a].text == "X" &&
        buttonList[b].text == "X" &&
        buttonList[c].text == "X") {
      winner = 1;
    }
  } else {
    if (buttonList[a].text == "O" &&
        buttonList[b].text == "O" &&
        buttonList[c].text == "O") {
      winner = 2;
    }
  }
}

