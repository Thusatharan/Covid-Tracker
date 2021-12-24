import 'package:flutter/material.dart';

class TweenColorScreen extends StatefulWidget {
  @override
  _TweenColorScreenState createState() => _TweenColorScreenState();
}

class _TweenColorScreenState extends State<TweenColorScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;

  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..repeat(reverse: true);

    _colorTween =
        ColorTween(begin: Color.fromRGBO(137, 255, 19, 1), end: Colors.red)
            .animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _colorTween,
          builder: (context, child) => Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Icon(
              Icons.wifi_outlined,
              size: 200.0,
              color: _colorTween.value,
            ),
          ),
        ),
      ),
    );
  }
}
