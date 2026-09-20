import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage>
    with SingleTickerProviderStateMixin {
  // when use one AnimationController => SingleTickerProviderStateMixin;
  // when use two and anthor AnimationController => TickerProviderStateMixin;

  late Animation<AlignmentGeometry> _greenAnimation;
  late Animation<AlignmentGeometry> _yellowAnimation;

  late AnimationController _animationController;

  // late Animation<double> _scale;

  // late Animation<RelativeRect> _rect;

  @override
  void initState() {
    super.initState();
    // 1
    // _scale = Tween<double>().animate(parent);

    // 2
    // _rect = RelativeRectTween().animate(parent);

    // 3
    _animationController = AnimationController(vsync: this);

    _greenAnimation = Tween<AlignmentGeometry>(
      begin: .topCenter,
      end: .bottomCenter,
    ).animate(_animationController);
    _yellowAnimation = Tween<AlignmentGeometry>(
      begin: .centerLeft,
      end: .centerRight,
    ).animate(_animationController);
  }

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
            _stackWidget(),
            SizedBox(height: 30),
            btnWidget(),
          ],
        ),
      ),
    );
  }

  Widget _stackWidget() => Expanded(
    child: Stack(
      children: [
        // ScaleTransition(scale: _scale),
        // PositionedTransition(rect: _rect, child: child)
        AlignTransition(
          alignment: _greenAnimation,
          child: CircleAvatar(backgroundColor: Colors.green),
        ),
        AlignTransition(
          alignment: _yellowAnimation,
          child: CircleAvatar(backgroundColor: Colors.amber),
        ),
      ],
    ),
  );

  Widget btnWidget() => ElevatedButton(
    onPressed: () {
      setState(() {});
    },
    child: Text("Click Here To Change"),
  );

  // BoxDecoration _getBoxDecouration() => BoxDecoration(
  //   borderRadius: (_animation == 100)
  //       ? BorderRadius.circular(10)
  //       : BorderRadius.circular(100),
  //   color: (_animation == 100) ? Colors.blue : Colors.green,
  // );
}
