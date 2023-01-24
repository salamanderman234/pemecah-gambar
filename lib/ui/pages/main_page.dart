import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:slicer/ui/widgets/button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const ButtonNetwork(
              url:
                  "https://drive.google.com/uc?export=view&id=1oAco8jVAj05qJ_dQTkwnkwRSX8TgXNwa",
              text: "network image",
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Local"),
            )
          ],
        ),
      ),
    );
  }
}
