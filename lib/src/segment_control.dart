import 'package:flutter/material.dart';

///A customizable segment control widget that allows for selecting
///between multiple options, with animated transitions and styling options.
class CustomSegmentControl extends StatefulWidget {
  /// A callback function that is triggered when the selected option changes.
  /// Returns the index of the selected option.
  final ValueChanged<int> onOptionChange;

  ///A list of strings representing the options in the segment control.
  final List<String> options;

  /// The width of the entire segment control. If not provided, it will default to the width of the screen.
  final double? boxWidth;

  /// The font size of the text in each option. Defaults to 14.
  final double? fontSize;

  ///The background color of the segment control. Defaults to Colors.white.
  final Color? backgroundColor;

  ///The color of the border surrounding the segment control. Defaults to Color(0xffE2E8F0).
  final Color? borderColor;

  ///The background color of the selected option. Defaults to Colors.black.
  final Color? selectedBackgroundColor;

  ///The color of the text for the selected option. Defaults to Colors.white.
  final Color? selectedTextColor;

  ///The color of the text for the unselected options. Defaults to Colors.black.
  final Color? unselectedTextColor;

  ///A list of shadows cast by the segment control container. Defaults to a subtle shadow.
  final List<BoxShadow>? boxShadow;

  ///The animation curve for the transition between options. Defaults to Curves.easeInOut.
  final Curve? animationCurve;

  ///The font weight of the text in each option. Defaults to FontWeight.w600.
  final FontWeight? fontWeight;

  /// A list of images to be used as backgrounds for each option when selected. If provided, it should match the length of the options list.
  final List<DecorationImage?>? decorationImages;

  ///The index of the initially selected option. Defaults to 0.
  final int initialSelectedIndex;

  ///Constructor
  const CustomSegmentControl({
    super.key,
    required this.onOptionChange,
    required this.options,
    this.boxWidth,
    this.backgroundColor,
    this.borderColor,
    this.fontSize,
    this.boxShadow,
    this.animationCurve,
    this.fontWeight,
    this.decorationImages,
    this.initialSelectedIndex = 0,
    this.selectedBackgroundColor = Colors.black,
    this.unselectedTextColor = Colors.black,
    this.selectedTextColor = Colors.white,
  });

  @override
  State<CustomSegmentControl> createState() => _CustomSegmentControlState();
}

class _CustomSegmentControlState extends State<CustomSegmentControl> {
  late int _selectedIndex;
  final _animationDuration = 150;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (details.primaryDelta! < -10 &&
          _selectedIndex < widget.options.length - 1) {
        _selectedIndex++;
      } else if (details.primaryDelta! > 10 && _selectedIndex > 0) {
        _selectedIndex--;
      }
      Future.delayed(Duration(milliseconds: _animationDuration))
          .then((value) => {widget.onOptionChange(_selectedIndex)});
    });
  }

  @override
  Widget build(BuildContext context) {
    final optionWidth = (widget.boxWidth ?? MediaQuery.sizeOf(context).width) /
            widget.options.length -
        (2 / widget.options.length);

    return Center(
      child: Container(
        width: widget.boxWidth ?? MediaQuery.sizeOf(context).width,
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
              alignment: Alignment(
                  -1 + 2 * _selectedIndex / (widget.options.length - 1), 0),
              child: Container(
                width: optionWidth,
                height: 30,
                decoration: BoxDecoration(
                  color: widget.selectedBackgroundColor,
                  image: widget.decorationImages != null
                      ? widget.decorationImages![_selectedIndex]
                      : null,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Row(
              children: List.generate(
                widget.options.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      Future.delayed(Duration(milliseconds: _animationDuration))
                          .then((value) =>
                              {widget.onOptionChange(_selectedIndex)});
                    },
                    onHorizontalDragUpdate: _onDragUpdate,
                    child: Container(
                      height: 30,
                      width: optionWidth,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text(
                        widget.options[index],
                        style: TextStyle(
                          fontSize: widget.fontSize ?? 14,
                          fontWeight: widget.fontWeight ?? FontWeight.w600,
                          color: _selectedIndex == index
                              ? widget.selectedTextColor
                              : widget.unselectedTextColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
