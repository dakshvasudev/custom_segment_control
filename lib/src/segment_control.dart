import 'package:flutter/material.dart';

class CustomSegmentControl extends StatefulWidget {
  final ValueChanged<bool> onOptionChange;
  final bool option2Selected;
  final String option1Text;
  final String option2Text;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? option1SelectedColor;
  final Color? option2SelectedColor;
  final List<BoxShadow>? boxShadow;
  final Curve? animationCurve;
  final FontWeight? fontWeight;
  final DecorationImage? option1DecorationImage;
  final DecorationImage? option2DecorationImage;

  const CustomSegmentControl({
    super.key,
    required this.onOptionChange,
    required this.option1Text,
    required this.option2Text,
    this.backgroundColor,
    this.borderColor,
    this.fontSize,
    this.boxShadow,
    this.animationCurve,
    this.fontWeight,
    this.option1DecorationImage,
    this.option2DecorationImage,
    this.option2Selected = true,
    this.option1SelectedColor = Colors.black,
    this.option2SelectedColor = Colors.black,
  });

  @override
  State<CustomSegmentControl> createState() => _CustomSegmentControlState();
}

class _CustomSegmentControlState extends State<CustomSegmentControl> {
  late bool _isSecondOptionSelected;
  final _animationDuration = 150;

  @override
  void initState() {
    super.initState();
    _isSecondOptionSelected = widget.option2Selected;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (details.primaryDelta! < -10) {
      setState(() {
        _isSecondOptionSelected = false;
      });
      Future.delayed(Duration(milliseconds: _animationDuration))
          .then((value) => {widget.onOptionChange(false)});
    } else if (details.primaryDelta! > 10) {
      setState(() {
        _isSecondOptionSelected = true;
      });
      Future.delayed(Duration(milliseconds: _animationDuration))
          .then((value) => {widget.onOptionChange(true)});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360,
        height: 34,
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          border: Border.all(
            color: widget.borderColor ?? const Color(0xffE2E8F0),
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: widget.boxShadow ??
              [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(1, 1),
                ),
              ],
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              curve: widget.animationCurve ?? Curves.easeInOut,
              duration: Duration(milliseconds: _animationDuration),
              alignment: _isSecondOptionSelected
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 180,
                height: 30,
                decoration: BoxDecoration(
                  color: _isSecondOptionSelected
                      ? widget.option2SelectedColor
                      : widget.option1SelectedColor,
                  image: _isSecondOptionSelected
                      ? widget.option2DecorationImage
                      : widget.option1DecorationImage,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSecondOptionSelected = false;
                    });
                    Future.delayed(Duration(milliseconds: _animationDuration))
                        .then((value) => {widget.onOptionChange(false)});
                  },
                  onHorizontalDragUpdate: _onDragUpdate,
                  child: Container(
                    height: 30,
                    width: 178,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      widget.option1Text,
                      style: TextStyle(
                        fontSize: widget.fontSize ?? 14,
                        fontWeight: widget.fontWeight ?? FontWeight.w600,
                        color: _isSecondOptionSelected
                            ? const Color(0xff0F172A)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSecondOptionSelected = true;
                    });
                    Future.delayed(Duration(milliseconds: _animationDuration))
                        .then((value) => {widget.onOptionChange(true)});
                  },
                  onHorizontalDragUpdate: _onDragUpdate,
                  child: Container(
                    height: 50,
                    width: 178,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      widget.option2Text,
                      style: TextStyle(
                        fontSize: widget.fontSize ?? 14,
                        color: _isSecondOptionSelected
                            ? Colors.white
                            : Colors.black,
                        fontWeight: widget.fontWeight ?? FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
