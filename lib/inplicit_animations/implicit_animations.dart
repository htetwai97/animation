import 'package:animation_lessons/explicit_animations/explicit_animations.dart';
import 'package:animation_lessons/utils/dimensions.dart';
import 'package:flutter/material.dart';

const kAnimationDuration = const Duration(milliseconds: 500);
const kAnimationDurationForScreenFadeIn = const Duration(milliseconds: 1000);

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool isNewDimensions = false;
  bool isDescriptionShown = true;
  bool isChangeBackGroundColor = false;
  bool isChangeButtonLayout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TweenAnimationBuilder(
            duration: kAnimationDurationForScreenFadeIn,
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double _opacity, child) => Opacity(
              opacity: _opacity,
              child: child,
            ),
            child: AnimatedContainer(
              duration: kAnimationDuration,
              color: (isChangeBackGroundColor) ? Colors.black : Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        AnimatedContainer(
                          duration: kAnimationDuration,
                          width: (isNewDimensions) ? 260 : 190,
                          height: (isNewDimensions) ? 250 : 180,
                          curve: Curves.easeInCubic,
                          child: Image.asset(
                            "assets/images/human_sitting.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          child: ExplicitAnimationFavouriteButton(),
                          top: 0,
                          left: 0,
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: kAnimationDuration,
                      child: Container(
                        height: isDescriptionShown ? null : 0.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: kMarginMedium2,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: kMarginMedium2,
                              ),
                              child: Text(
                                "What is the mission of human life? The mission of human life is to end the miseries of material existence and attain a blissful life. We are constantly searching after happiness, but we often fail in our pursuit. We may get a glimpse of happiness, but it does not last forever. We do not want miseries, but we cannot avoid them.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: (isChangeBackGroundColor)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: kMarginMedium2),
                    AnimatedSize(
                      duration: kAnimationDuration,
                      child: AnimatedSwitcher(
                        duration: kAnimationDuration,
                        child: (isChangeButtonLayout)
                            ? PrimaryButtonsInWrap(
                                onTapChangeDimension: () {
                                  setState(() {
                                    isNewDimensions = !isNewDimensions;
                                  });
                                },
                                onTapChangeTheme: () {
                                  setState(() {
                                    isChangeBackGroundColor =
                                        !isChangeBackGroundColor;
                                  });
                                },
                                onTapShowDescription: () {
                                  setState(() {
                                    isDescriptionShown = !isDescriptionShown;
                                  });
                                },
                              )
                            : PrimaryButtonsInColumn(
                                onTapChangeDimension: () {
                                  setState(() {
                                    isNewDimensions = !isNewDimensions;
                                  });
                                },
                                onTapChangeTheme: () {
                                  setState(() {
                                    isChangeBackGroundColor =
                                        !isChangeBackGroundColor;
                                  });
                                },
                                onTapShowDescription: () {
                                  setState(() {
                                    isDescriptionShown = !isDescriptionShown;
                                  });
                                },
                              ),
                      ),
                    ),
                    SizedBox(height: kMarginMedium2),
                    PrimaryButton(
                      onTap: () {
                        setState(() {
                          isChangeButtonLayout = !isChangeButtonLayout;
                        });
                      },
                      label: "Change Button Layout",
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: kAnimationDurationForScreenFadeIn,
            builder: (context, double _value, child) => Opacity(
              opacity: _value,
              child: Padding(
                padding: EdgeInsets.only(
                  top: _value * 64,
                  left: 16.0,
                ),
                child: child,
              ),
            ),
            child: Text(
              "PADC Animation",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color:
                      (isChangeBackGroundColor) ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButtonsInWrap extends StatelessWidget {
  final Function onTapChangeDimension;
  final Function onTapShowDescription;
  final Function onTapChangeTheme;
  PrimaryButtonsInWrap({
    required this.onTapChangeDimension,
    required this.onTapChangeTheme,
    required this.onTapShowDescription,
  });
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        PrimaryButton(
          onTap: onTapChangeDimension,
          label: "Change Dimension",
        ),
        PrimaryButton(
          onTap: onTapShowDescription,
          label: "Show Description",
        ),
        PrimaryButton(
          onTap: onTapChangeTheme,
          label: "Change Theme",
        ),
      ],
    );
  }
}

class PrimaryButtonsInColumn extends StatelessWidget {
  final Function onTapChangeDimension;
  final Function onTapShowDescription;
  final Function onTapChangeTheme;
  PrimaryButtonsInColumn(
      {required this.onTapChangeDimension,
      required this.onTapChangeTheme,
      required this.onTapShowDescription});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          onTap: onTapChangeDimension,
          label: "Change Dimension",
        ),
        PrimaryButton(
          onTap: onTapShowDescription,
          label: "Show Description",
        ),
        PrimaryButton(
          onTap: onTapChangeTheme,
          label: "Change Theme",
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final Color color;
  PrimaryButton({
    required this.onTap,
    required this.label,
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onTap(),
      child: Text(label),
      textColor: Colors.white,
      color: color,
    );
  }
}
