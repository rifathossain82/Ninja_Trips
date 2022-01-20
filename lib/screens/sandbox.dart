import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {

  @override
  _SandBoxState createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
          duration: Duration(seconds: 1),
        width: _width,
        margin: EdgeInsets.all(_margin),
        color: _color,
        child: Column(
          children: [
            RaisedButton(
              onPressed: (){
                setState(() {
                  _margin=100;
                });
              },
              child: Text('Animate Margin'),
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  _color=Colors.green;
                });
              },
              child: Text('Animate Margin'),
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  _width=300;
                });
              },
              child: Text('Animate Margin'),
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  _opacity=0;
                });
              },
              child: Text('Hide text'),
            ),
            AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
              child: Text('Rifat Hossain'),

            )
          ],
        ),
      ),
    );
  }
}
