import 'package:animation_lessons/utils/dimensions.dart';
import 'package:flutter/material.dart';

const kAnimationDurationForFavourite = Duration(milliseconds: 1000);

class ExplicitAnimationFavouriteButton extends StatefulWidget {
  const ExplicitAnimationFavouriteButton({Key? key}) : super(key: key);
  @override
  State<ExplicitAnimationFavouriteButton> createState() =>
      _ExplicitAnimationFavouriteButtonState();
}

class _ExplicitAnimationFavouriteButtonState
    extends State<ExplicitAnimationFavouriteButton>
    with TickerProviderStateMixin {
  /// State
  bool isAnimationComplete = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: kAnimationDurationForFavourite,
    );
    _colorAnimation = ColorTween(begin: Colors.grey[500], end: Colors.red)
        .animate(_controller.view);
    _sizeAnimation = Tween<double>(begin: kMarginXLarge, end: kMarginXXLarge)
        .animate(_controller.view);
    _controller.addStatusListener((status) {
      isAnimationComplete = (status == AnimationStatus.completed);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, _) => Card(
        child: IconButton(
          onPressed: () {
            if (isAnimationComplete) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
            //  _controller.repeat();
          },
          icon: Icon(
            Icons.favorite,
            size: _sizeAnimation.value,
            color: _colorAnimation.value,
          ),
        ),
      ),
    );
  }
}
