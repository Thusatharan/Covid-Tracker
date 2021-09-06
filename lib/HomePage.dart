import 'package:corona_stats/Providers/stats_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _rotateAnimationController;
  Animation _colorTween;

  DateTime dateToday = new DateTime.now();

  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..repeat();

    _rotateAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 60000))
      ..repeat();

    _colorTween =
        ColorTween(begin: Color.fromRGBO(137, 255, 19, 1), end: Colors.red)
            .animate(_animationController);

    super.initState();
    final postMdl = Provider.of<StatsProvider>(context, listen: false);
    postMdl.getPostData(context);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<StatsProvider>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      transform: Matrix4.translationValues(120.0, 0.0, 0.0),
                      child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0)
                            .animate(_rotateAnimationController),
                        child: Image.asset(
                          "assets/images/corona_green.png",
                          height: 300,
                        ),
                      ),
                    ),

                    // color: Colors.transparent,

                    // Expanded(...)
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 70),
                    child: Text(
                      'Covid-19 Stats',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Inter'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 80, left: 20),
                    width: MediaQuery.of(context).size.width / 2,
                    child: RichText(
                      text: TextSpan(
                          text: 'Get the. \n',
                          style: TextStyle(fontSize: 30),
                          children: [
                            TextSpan(
                                text: 'Latest \n',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor)),
                            TextSpan(
                                text: 'updates..',
                                style: TextStyle(
                                  fontSize: 30,
                                )),
                          ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 90, right: 20, bottom: 10),
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                              text: 'Updated at \n',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              children: [
                                postMdl.loading
                                    ? TextSpan(
                                        text: 'Loading',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Theme.of(context).primaryColor),
                                      )
                                    : TextSpan(
                                        text:
                                            // DateFormat.yMd().format(postMdl.post.updatedAt),
                                            postMdl.post.updatedAt,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context)
                                                .primaryColor)),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                padding: EdgeInsets.only(top: 5),
                                margin: EdgeInsets.all(5),
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 2),
                                  color: Colors.black45,
                                ),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: AnimatedBuilder(
                                              animation: _colorTween,
                                              builder: (context, child) =>
                                                  Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Icon(
                                                  Icons.circle,
                                                  size: 10.0,
                                                  color: _colorTween.value,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              'New Cases',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: postMdl.loading
                                          ? Text(
                                              'Loading',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 20,
                                                  fontFamily: 'Orbitron'),
                                            )
                                          : Text(
                                              postMdl.post.todayCases
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 30,
                                                  fontFamily: 'Orbitron'),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.only(top: 5),
                                margin: EdgeInsets.all(5),
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 2),
                                  color: Colors.black45,
                                ),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Deaths',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: postMdl.loading
                                          ? Text(
                                              'Loading',
                                              style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 20,
                                                  fontFamily: 'Orbitron'),
                                            )
                                          : Text(
                                              postMdl.post.todayDeath
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 30,
                                                  fontFamily: 'Orbitron'),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(top: 5),
                              margin: EdgeInsets.all(5),
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                                color: Colors.black45,
                              ),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Total Cases',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: postMdl.loading
                                        ? Text(
                                            'Loading',
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 20,
                                                fontFamily: 'Orbitron'),
                                          )
                                        : Text(
                                            postMdl.post.totalDeath.toString(),
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 30,
                                                fontFamily: 'Orbitron'),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(top: 5),
                              margin: EdgeInsets.all(5),
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                                color: Colors.black45,
                              ),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Total Recovered',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: postMdl.loading
                                        ? Text(
                                            'Loading',
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 20,
                                                fontFamily: 'Orbitron'),
                                          )
                                        : Text(
                                            postMdl.post.totalDeath.toString(),
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 30,
                                                fontFamily: 'Orbitron'),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, right: 20, bottom: 10),
                    width: double.infinity,
                    child: Text('Hello'),
                  )
                ],
              )
            ],
          ),
        ) /* add child content here */,
      ),
    );
  }
}
