import 'package:flutter/material.dart';

class CustomSegmentControl extends StatefulWidget {
  final ValueChanged<bool> onOptionChange;
  final bool option2Selected;
  final Color? backgroundColor;
  final Color? borderColor;
  final String optionText1;
  final String optionText2;
  final double? fontSize;
  final List<BoxShadow>? boxShadow;
  final Curve? animationCurve;
  final FontWeight? fontWeight;

  const CustomSegmentControl({
    super.key,
    required this.onOptionChange,
    required this.optionText1,
    required this.optionText2,
    this.option2Selected = true,
    this.backgroundColor,
    this.borderColor,
    this.fontSize,
    this.boxShadow,
    this.animationCurve,
    this.fontWeight,
  });

  @override
  _CustomSegmentControlState createState() => _CustomSegmentControlState();
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
                  color: _isSecondOptionSelected ? null : Colors.black,
                  image: _isSecondOptionSelected
                      ? const DecorationImage(
                          image: AssetImage(
                            'assets/images/ai_tools/suraasa_gradient.png',
                          ),
                          fit: BoxFit.fitWidth,
                        )
                      : null,
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
                      widget.optionText1,
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
                      widget.optionText2,
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
