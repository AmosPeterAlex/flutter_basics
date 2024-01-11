import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListViewEg(),
  ));
}

class ListViewEg extends StatelessWidget {
  const ListViewEg({super.key});

  @override
  Widget build(BuildContext context) {
    var name = [
      'Amos',
      'Adolf',
      'Sajin',
      'Athulya',
      'Jeni',
      'Vivian',
      'Surya',
      'Aakash',
      'Cibi',
      'Rohan',
      'Sibin'
    ];
    var msgs = [
      'Hi',
      'Da',
      'Endeda',
      'eek',
      'ok',
      'ala',
      'ano',
      'm',
      'ohdei',
      'nokam',
    ];
    var textMsgNo = [5, 2, 7, 5, 5, 2, 1, 1, 3, 1];
    var text = [
      'Today',
      'Today',
      'Today',
      'Today',
      'Today',
      'Yesterday',
      'Yesterday',
      'Yesterday',
      'Yesterday',
      'Yesterday',
    ];
    var icons = [
      Icon(
        Icons.done_all_sharp,
        color: Colors.grey,
      ),
      Icon(
        Icons.done,
        color: Colors.grey,
      ),
      Icon(
        Icons.done_all_sharp,
        color: Colors.blue,
      ),
      Icon(
        Icons.done,
        color: Colors.grey,
      ),
      Icon(
        Icons.done_all_sharp,
        color: Colors.grey,
      ),
      Icon(
        Icons.done,
        color: Colors.grey,
      ),
      Icon(
        Icons.done_all_sharp,
        color: Colors.blue,
      ),
      Icon(
        Icons.done,
        color: Colors.grey,
      ),
      Icon(
        Icons.done_all_sharp,
        color: Colors.blue,
      ),
      Icon(
        Icons.done_all_sharp,
        color: Colors.blue,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "List View Example",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
          children: List.generate(
              10,
              (index) => ListTile(
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/my profile pic.jpg"),
                    ),
                    title: Text(name[index]),
                    subtitle: Row(
                      children: [
                        icons[index],
                        Text(msgs[index]),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        Text(text[index]),
                        const SizedBox(
                          height: 2,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 10,
                          child: Text(textMsgNo[index].toString()),
                        )
                      ],
                    ),
                  ))),
    );
  }
}
