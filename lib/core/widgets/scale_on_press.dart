import 'package:flutter/material.dart';

class ScaleOnPress extends StatefulWidget {
  final double onPressScale;
  final Widget child;
  final void Function()? onClick;

  const ScaleOnPress({
    super.key,
    required this.onPressScale,
    required this.child,
    this.onClick,
  });

  @override
  State<StatefulWidget> createState() => _ScaleOnPressState();
}

class _ScaleOnPressState extends State<ScaleOnPress> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = widget.onPressScale;
    });
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onClick != null) {
      widget.onClick!();
    }

    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTapDown: _onTapDown,
    onTapUp: _onTapUp,
    onTapCancel: _onTapCancel,
    child: AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 200),
      child: widget.child,
    ),
  );
}
