import 'package:flutter/material.dart';
import 'dart:math' as math show sin, pi;

// Import the Animation class from the flutter/animation library

//import 'delay.dart';

class WidgetDotBounce extends StatefulWidget {
  const WidgetDotBounce({
    Key? key,
    this.color,
    this.size = 18.0,
    this.count = 3,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 300),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double size;
  final int count;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  WidgetDotBounceState createState() => WidgetDotBounceState();
}

class WidgetDotBounceState extends State<WidgetDotBounce>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(
            vsync: this,
            duration: Duration(
                milliseconds: widget.count * widget.duration.inMilliseconds)))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 3.2, widget.size * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.count, (i) {
            return SlideTransition(
              position: DelayTweenOffset(
                      begin: const Offset(0, 0.5),
                      end: const Offset(0, -0.5),
                      delay: i * 0.2)
                  .animate(_controller),
              child: SizedBox.fromSize(
                  size: Size.square(widget.size * 0.5), child: _itemBuilder(i)),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));
}

class WidgetDotFade extends StatefulWidget {
  const WidgetDotFade({
    Key? key,
    this.color,
    this.size = 18.0,
    this.count = 3,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 500),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double size;
  final int count;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  WidgetDotFadeState createState() => WidgetDotFadeState();
}

class WidgetDotFadeState extends State<WidgetDotFade>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(
            vsync: this,
            duration: Duration(
                milliseconds: widget.count * widget.duration.inMilliseconds)))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 3.2, widget.size * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.count, (i) {
            return FadeTransition(
              opacity: DelayTween(begin: 0.1, end: 1.0, delay: i * 0.2)
                  .animate(_controller),
              child: SizedBox.fromSize(
                  size: Size.square(widget.size * 0.5), child: _itemBuilder(i)),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));
}

// Import the sin and pi functions from the math library with the name "math"

// Define a DelayTween class that extends the Tween class for double values
class DelayTween extends Tween<double> {
  // The constructor for the DelayTween class
  DelayTween({double? begin, double? end, required this.delay})
      : super(begin: begin, end: end);

  // The delay value for the animation
  final double delay;

  // Override the lerp method to adjust the animation's progress based on the delay value
  @override
  double lerp(double t) {
    // Use the sin function from the math library to calculate a sine wave based on the current time and delay
    // Add 1 to the result to make sure it's always positive, then divide by 2 to get a value between 0 and 1
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  // Override the evaluate method to call the lerp method with the animation's current value
  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

// Define a DelayTweenOffset class that extends the Tween class for Offset values
class DelayTweenOffset extends Tween<Offset> {
  // The constructor for the DelayTweenOffset class
  DelayTweenOffset({Offset? begin, Offset? end, required this.delay})
      : super(begin: begin, end: end);

  // The delay value for the animation
  final double delay;

  // Override the lerp method to adjust the animation's progress based on the delay value
  @override
  Offset lerp(double t) {
    // Use the sin function from the math library to calculate a sine wave based on the current time and delay
    // Add 1 to the result to make sure it's always positive, then divide by 2 to get a value between 0 and 1
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  // Override the evaluate method to call the lerp method with the animation's current value
  @override
  Offset evaluate(Animation<double> animation) => lerp(animation.value);
}

class WidgetDotGrow extends StatefulWidget {
  const WidgetDotGrow({
    Key? key,
    this.color,
    this.size = 18.0,
    this.count = 3,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 300),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double size;
  final int count;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  WidgetDotGrowState createState() => WidgetDotGrowState();
}

class WidgetDotGrowState extends State<WidgetDotGrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(
            vsync: this,
            duration: Duration(
                milliseconds: widget.count * widget.duration.inMilliseconds)))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 3.5, widget.size * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.count, (i) {
            return ScaleTransition(
              scale: DelayTween(begin: 1.0, end: 1.3, delay: i * 0.2)
                  .animate(_controller),
              child: SizedBox.fromSize(
                  size: Size.square(widget.size * 0.5), child: _itemBuilder(i)),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));
}
