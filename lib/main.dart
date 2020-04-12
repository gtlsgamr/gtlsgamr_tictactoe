import 'package:flutter/material.dart';
import 'package:tictactoe/aboutpage.dart';
import 'package:tictactoe/button_class.dart';
import 'package:tictactoe/globals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.redAccent,
        canvasColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void GoshowDialog(BuildContext context, String titleMessage) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(titleMessage),
          content: new Text("Thank you for playing."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("RESET"),
              onPressed: () {
                setState(() {
                  resetBoard();
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  checkWinner() {
    for (var a in winCombos) {
      checkTest(a[0], a[1], a[2], 1);
      checkTest(a[0], a[1], a[2], 2);
    }

    for (var a in buttonList) {
      if (a.enabled == true) {
        butts = 0;
        break;
      } else
        butts = 1;
    }
    winner = butts == 1 ? 3 : winner;
    switch (winner) {
      case 1:
        GoshowDialog(context, "Player 1 wins!!");
        break;
      case 2:
        GoshowDialog(context, "Player 2 wins!!");
        break;
      case 3:
        GoshowDialog(context, "Sorry, its a draw. :(");
    }
  }

  buttonClicked(XoButton a) {
    if (a.enabled == true) {
      if (currPlayer == 1) {
        a.bg = Colors.red;
        a.text = "X";
        a.enabled = false;
        currPlayer = 2;
        checkWinner();
      } else {
        a.bg = Colors.blue;
        a.text = "O";
        a.enabled = false;
        currPlayer = 1;
        checkWinner();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 50.0, 0, 0),
            children: <Widget>[
              Container(
                color: Colors.black,
                child: ListTile(
                  title: Text('About the developer', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => aboutPage()));
                  },
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Tic Tac Toe"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: buttonList[index].bg,
                        child: FlatButton(
                            splashColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                buttonClicked(buttonList[index]);
                              });
                            },
                            child: Center(
                                child: Text(
                              buttonList[index].text,
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ))),
                      );
                    })),
            InkWell(
              onTap: () {
                setState(() {
                  resetBoard();
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.10,
                child: Center(
                  child: Text("RESET",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      )),
                ),
                color: Colors.red,
              ),
            )
          ],
        ));
  }
}
