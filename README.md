<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This Flutter package provides a customizable segment control widget that allows users to toggle between two options. The widget supports various customization options including text, colors, font size, animations, and background images for each segment. It also includes drag gestures for seamless interaction and is ideal for scenarios requiring a binary choice, such as switching between two modes or options.

## Features

![ScreenRecording2024-08-25at1 06 25AM-ezgif com-crop](https://github.com/user-attachments/assets/02e8928e-d942-46f5-b34b-fb45f7110959)

- **Customizable Appearance**: Adjust text, font size, font weight, colors, and background images for both options.
- **Smooth Animations**: Built-in animations with customizable curves and durations.
- **Interactive Drag Gestures**: Users can switch between options with swipe gestures.
- **Configurable Shadow and Borders**: Add custom shadows and borders to match your app’s design.
- **Flexible Integration**: Easily integrate into any Flutter project with support for state management.

## Getting started

To use this package, add `custom_segment_control` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  custom_segment_control: ^1.0.0
```

Then, run `flutter pub get` to install the package.

## Usage

```dart
import 'package:custom_segment_control/custom_segment_control.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _pro = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Segment Control Example'),
      ),
      body: Center(
        child: CustomSegmentControl(
          option1Text: 'Free',
          option2Text: 'Pro',
          onOptionChange: (isProMode) {
            setState(() {
              _pro = isProMode;
            });
          },
          option1SelectedColor: Colors.blue,
          option2SelectedColor: Colors.green,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
```

## Additional information

If you encounter any issues, feel free to open an issue on the GitHub repository.

Contributions are welcome! Whether it's reporting bugs, suggesting features, or submitting a pull request, your input is appreciated.

For further details or support, you can reach out to the package authors via the repository or through the contact information provided.

Happy coding! 🚀

# custom_segment_control
