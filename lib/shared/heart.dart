import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<Color> colorAnimation;
  Animation<double> sizeAnimation;
  Animation _curves;
  bool _status=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: 600));

    _curves=CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    colorAnimation=ColorTween(begin: Colors.grey[400],end: Colors.red).animate(_curves);

    controller.addListener(() {
      print(controller.value);
    });


    sizeAnimation=TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 30,end: 50),
            weight: 50
        ),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 50,end: 30),
            weight: 50
        ),
      ]
    ).animate(_curves);


  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context,_){
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: colorAnimation.value,
            size: sizeAnimation.value,
          ),
          onPressed: () {
            _status?controller.reverse():controller.forward();

            setState(() {
              _status=!_status;
            });
          },
        );
      },
    );
  }
}
