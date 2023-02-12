import 'package:flutter/material.dart';
import 'package:jam_epitech/colorType.dart';
import 'package:jam_epitech/personType.dart';
import 'package:jam_epitech/globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            "Quel super héros ou super vilain es-tu ? ".toUpperCase(),
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
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => ColorQuestions(),
                          transitionDuration: Duration(milliseconds: 200),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
                        "Start Quizz".toUpperCase(),
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
      ],
    );
  }
}
