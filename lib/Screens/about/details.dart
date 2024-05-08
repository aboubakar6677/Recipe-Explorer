import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
          child: Container(
        child: const Text('All You need, You can find here')
            .textColor(Colors.white),
      )),
    );
  }
}
