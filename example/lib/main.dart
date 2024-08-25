import 'package:custom_segment_control/custom_segment_control.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _pro = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Segment Control Example'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text('Example : For a custom color segment control'),
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
          const Text('Example : For a decoration image'),
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
              option2DecorationImage: const DecorationImage(
                image: AssetImage('assets/images/example1.jpg'),
                fit: BoxFit.fitWidth,
              ),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Example : For custom inactive window color specification',
          ),
          Center(
            child: CustomSegmentControl(
              option1Text: 'Free',
              option2Text: 'Pro',
              onOptionChange: (isProMode) {
                setState(() {
                  _pro = isProMode;
                });
              },
              backgroundColor: Colors.green,
              option1SelectedColor: Colors.black,
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
