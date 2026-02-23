import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantor_lurah/presentation/first_screen.dart';

Timer setTimeout(callback, [int duration = 1000]) {
  return Timer(Duration(milliseconds: duration), callback);
}

void clearTimeout(Timer t) {
  t.cancel();
}

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);
  @override
  // TODO: implement barrierColor
  Color get barrierColor => Colors.black;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 1000);
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setTimeout(() {
      Navigator.of(context).pushReplacement(
        CustomPageRoute(
          FirstScreen(),
        ),
      );
    }, 3000);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/image/logo.png',
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          const SizedBox(
            height: 16,
          ),
          const Center(
            child: Text(
              'KELURAHAN MAHARATU PEKANBARU',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
