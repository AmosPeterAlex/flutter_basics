import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: WhatsappSplash()));
}

class WhatsappSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 110,
            ),
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/2044px-WhatsApp.svg.png",
              height: 120,
              width: 130,
            ),
            Text("from",
                textAlign: TextAlign.right,
                style: TextStyle(fontStyle: FontStyle.italic)),
            SizedBox(
              height: 150,
            ),
            Image.network(
                "data:image/png;base64,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")
          ],
        ),
      ),
    );
  }
}
