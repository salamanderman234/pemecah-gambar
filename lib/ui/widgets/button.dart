import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:slicer/ui/pages/image_page.dart';

class ButtonNetwork extends StatelessWidget {
  final String url;
  final String text;
  const ButtonNetwork({super.key, required this.url, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImagePage(url: url),
          ),
        );
      },
      child: Text(text),
    );
  }
}
