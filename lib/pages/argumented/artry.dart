import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sains/theme/designCourseAppTheme.dart';
// import 'package:dio/dio.dart';
import 'dart:async';
// import 'package:simple_permissions/simple_permissions.dart';
// import 'package:file_utils/file_utils.dart';

class ArTry extends StatefulWidget {
  @override
  _ArTryState createState() => _ArTryState();
}

class _ArTryState extends State<ArTry> with TickerProviderStateMixin {
  final infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  void setData() async {
    animationController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tempHight = (MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0);
    return WillPopScope(
          child: Container(
        color: DesignCourseAppTheme.nearlyWhite,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.2,
                    child: Image.asset('assets/design_course/reality.jpg'),
                  ),
                ],
              ),
              Positioned(
                top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
                bottom: 0,
                left: 0,
                right: 0,
                child: new ScaleTransition(
                  alignment: Alignment.center,
                  scale: new CurvedAnimation(
                      parent: animationController, curve: Curves.fastOutSlowIn),
                  child: Container(
                    decoration: BoxDecoration(
                      color: DesignCourseAppTheme.nearlyWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: DesignCourseAppTheme.grey.withOpacity(0.2),
                            offset: Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: SingleChildScrollView(
                        child: Container(
                          constraints: BoxConstraints(
                              minHeight: infoHeight,
                              maxHeight: tempHight > infoHeight
                                  ? tempHight
                                  : infoHeight),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 32.0, left: 18, right: 16),
                                child: Text(
                                  "BAB 1\nRangsangan dan Gerak Balas",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    letterSpacing: 0.27,
                                    color: DesignCourseAppTheme.darkerText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 32.0, left: 18, right: 16),
                                child: Text(
                                  "Menerangkan tentang sistem respirasi manusia",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    letterSpacing: 0.27,
                                    color: DesignCourseAppTheme.darkerText,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                               Padding(
                               padding: const EdgeInsets.only(
                                    top: 32.0, left: 18, right: 16),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: Text("DFC 2033\nDatabase System"),
                                  color: Colors.white,
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => FileDownloader()));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).padding.bottom,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
                right: 35,
                child: new ScaleTransition(
                  alignment: Alignment.center,
                  scale: new CurvedAnimation(
                      parent: animationController, curve: Curves.fastOutSlowIn),
                  child: Card(
                    color: DesignCourseAppTheme.nearlyBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    elevation: 10.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () => showDialog<bool>(
        context: context,
         builder: (c) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          title: Text('Exit'),
          content: Text('Sure?'),
          actions: [
            FlatButton(
              child: Text(
                'No',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () => Navigator.pop(c, false),
            ),
            FlatButton(
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () => SystemNavigator.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
