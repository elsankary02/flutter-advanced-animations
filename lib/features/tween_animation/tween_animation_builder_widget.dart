import 'package:flutter/material.dart';

class TweenAnimationBuilderWidget extends StatefulWidget {
  const TweenAnimationBuilderWidget({super.key});

  @override
  State<TweenAnimationBuilderWidget> createState() =>
      _TweenAnimationBuilderWidgetState();
}

class _TweenAnimationBuilderWidgetState
    extends State<TweenAnimationBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tween Animation Basics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            SizedBox(height: 30),
            // containerWidget(),
            SizedBox(height: 30),
            btnWidget(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget btnWidget() => ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TweenAnimationWidget()),
      );
    },
    child: Text("Click Here To Change"),
  );
}

class TweenAnimationWidget extends StatelessWidget {
  const TweenAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tween Animation Basics'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: IntTween(begin: 0, end: 100),
          duration: Duration(seconds: 1),
          builder: (context, value, child) {
            return Text(value.toString(), style: _getTextStyle());
          },
        ),
      ),
    );
  }

  TextStyle _getTextStyle() =>
      TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.blue);
}
