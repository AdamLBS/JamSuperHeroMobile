import 'package:flutter/material.dart';
import 'package:jam_epitech/dutyType.dart';
import 'globals.dart' as globals;

class WishQuestions extends StatefulWidget {
  const WishQuestions({super.key});

  @override
  State<WishQuestions> createState() => _WishQuestionsState();
}

class _WishQuestionsState extends State<WishQuestions> {
  List<String> answers = [];
  @override
  void initState() {
    answers.add("Le pouvoir");
    answers.add("La paix");
    answers.add("L'égalité");
    answers.add("Vous amuser");
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
                    "Que souhaitez-vous ?".toUpperCase(),
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
                              globals.thanos += 1;
                              globals.lex += 1;
                            }
                            if (index == 1) {
                              globals.superman += 1;
                              globals.batman += 1;
                              globals.spider += 1;
                            }
                            if (index == 2) {
                              globals.mandela += 1;
                            }
                            if (index == 3) {
                              globals.joker += 1;
                              globals.venom += 1;
                            }
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => DutyQuestions(),
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
