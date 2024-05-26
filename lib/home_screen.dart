import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_chat/chat_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> people = [
    'Colt',
    'Myra',
    'Neeta',
    'Sarah',
    'Natasha',
    'Robert',
    'Thomas',
    'Natasha',
    'Claire',
    'Olivia',
    'Emma',
    'Amelia',
    'Liam',
    'William',
    'Lucas',
    'Henry',
    'Mia',
    'Ava',
    'Evelyn',
    'Luna',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Mohil,',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 12),
            ),
            Text(
              'Xchat',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_square,
                  color: Colors.grey,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
                itemCount: people.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            image: DecorationImage(
                                image: AssetImage('assets/${i + 1}.png'),
                                scale: 10),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(people[i])
                      ],
                    ),
                  );
                }),
          ),
          const Divider(),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: people.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              ChatDetailsScreen(index + 1, people[index]),
                        ),
                      );
                    },
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset("assets/${index + 1}.png"),
                      ),
                    ),
                    title: Text(
                      people[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "blabalbalablabla 🔥 ...",
                    ),
                    trailing: Column(
                      children: [
                        const Text(
                          '00.21',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.pin_fill,
                              size: 15,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              child: const Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      )),
    );
  }
}
