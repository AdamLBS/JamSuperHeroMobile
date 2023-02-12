import 'package:flutter/material.dart';
import 'package:jam_epitech/colorType.dart';
import 'globals.dart' as globals;

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String result = "";
  int score = 0;
  @override
  void initState() {
    if (globals.lex > score) {
      score = globals.lex;
      result = "Lex";
    }
    if (globals.spider > score) {
      score = globals.spider;
      result = "Spiderman";
    }
    if (globals.superman > score) {
      score = globals.superman;
      result = "Superman";
    }
    if (globals.mandela > score) {
      score = globals.mandela;
      result = "Mandela";
    }
    if (globals.joker > score) {
      score = globals.joker;
      result = "Joker";
    }
    if (globals.venom > score) {
      score = globals.venom;
      result = "Venom";
    }
    if (globals.batman > score) {
      score = globals.batman;
      result = "Batman";
    }
    if (globals.thanos > score) {
      score = globals.thanos;
      result = "Thanos";
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        backgroundColor: Color(0xFF0C27CA),
        body: SafeArea(
            child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/logo.png',
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: Flexible(
                    child: Text(
                      "Résultats".toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  child: Flexible(
                    child: Text(
                      result.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.italic,
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 7),
                          ),
                          child: InkWell(
                            onTap: () {
                              globals.lex = 0;
                              globals.spider = 0;
                              globals.superman = 0;
                              globals.mandela = 0;
                              globals.joker = 0;
                              globals.venom = 0;
                              globals.batman = 0;
                              globals.thanos = 0;
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => ColorQuestions(),
                                  transitionDuration:
                                      Duration(milliseconds: 200),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(1.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));

                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Recommencer".toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                )
              ]),
        )));
  }
}
