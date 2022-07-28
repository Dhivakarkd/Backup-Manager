import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  int count = 0;

  void _increment() {
    setState(() {
      count++;
      print(count);
    });
  }

  void copyFile() async {
    var file = File(
        '/home/dhivakar_kd/Documents/Flutter_Test/IMG_20211030_200906_Bokeh.jpg');

    var rand = Random();

    for (int i = 0; i < 35; i++) {
      file.copy(
          '/home/dhivakar_kd/Documents/Flutter_Test/testFile ${rand.nextInt(50).toString()} .jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Colors.blue.withOpacity(0.04);
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed))
                    return Colors.blue.withOpacity(0.12);
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () {
              copyFile();
            },
            child: Text('Copy File')),
      ),
    );
  }
}
