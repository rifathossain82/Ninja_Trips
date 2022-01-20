import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Text(
        text,
        style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      duration: Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0,end: 1),
      builder: (context,double _val,child){
        double d=_val*50;
        return Opacity(
          opacity: _val,
          child: Padding(
            padding: EdgeInsets.only(top: d),
            child: child,
          ),
        );
      },
    );
  }
}
