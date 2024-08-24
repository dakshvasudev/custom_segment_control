import 'package:custom_segment_control/custom_segment_control.dart';
import 'package:flutter/material.dart';

class BasicExample extends StatefulWidget {
  const BasicExample({super.key});

  @override
  State<BasicExample> createState() => _BasicExampleState();
}

class _BasicExampleState extends State<BasicExample> {
  bool _pro = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Segment Control Example'),
      ),
      body: Column(
        children: [
          Center(
            child: CustomSegmentControl(
              option1Text: 'Free',
              option2Text: 'Pro',
              onOptionChange: (isProMode) {
                setState(() {
                  _pro = isProMode;
                });
              },
              option1SelectedColor: Colors.black,
              option2SelectedColor: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          if (_pro) const Text('You are on the pro screen'),
          if (!_pro) const Text('You are on the free screen'),
        ],
      ),
    );
  }
}
