import 'package:flutter/material.dart';
import 'package:jam_epitech/humanType.dart';
import 'globals.dart' as globals;

class FearQuestions extends StatefulWidget {
  const FearQuestions({super.key});

  @override
  State<FearQuestions> createState() => _FearQuestionsState();
}

class _FearQuestionsState extends State<FearQuestions> {
  List<String> answers = [];
  @override
  void initState() {
    answers.add("Perdre ceux que j'aime");
    answers.add("Laisser le chaos s'installer");
    answers.add("Ne pas arriver au bout de mes objectifs");
    answers.add("Ne pas être libre");
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
                  child: Text(
                    "Votre plus grande peur ? ".toUpperCase(),
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
                ListView.builder(
                  itemCount: answers.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 7),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (index == 0) {
                              globals.spider += 1;
                              globals.superman += 1;
                            }
                            if (index == 1) {
                              globals.batman += 1;
                            }
                            if (index == 2) {
                              globals.thanos += 1;
                              globals.mandela += 1;
                              globals.lex += 1;
                            }
                            if (index == 3) {
                              globals.venom += 1;
                              globals.joker += 1;
                            }
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => HumanQuestions(),
                                transitionDuration: Duration(milliseconds: 200),
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
                          child: Text(
                            answers[index].toUpperCase(),
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
                    );
                  },
                )
              ]),
        )));
  }
}
