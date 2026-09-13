import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _animation = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Animated Foo Baasics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            SizedBox(height: 30),
            containerWidget(),
            SizedBox(height: 30),
            btnWidget(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget containerWidget() => AnimatedContainer(
    duration: Duration(seconds: 1),
    curve: Curves.bounceIn,
    height: _animation,
    width: _animation,
    decoration: _getBoxDecouration(),
  );

  Widget btnWidget() => ElevatedButton(
    onPressed: () {
      _animation = (_animation == 100) ? 200 : 100;
      setState(() {});
    },
    child: Text("Click Here To Change"),
  );

  BoxDecoration _getBoxDecouration() => BoxDecoration(
    borderRadius: (_animation == 100)
        ? BorderRadius.circular(10)
        : BorderRadius.circular(100),
    color: (_animation == 100) ? Colors.blue : Colors.green,
  );
}
