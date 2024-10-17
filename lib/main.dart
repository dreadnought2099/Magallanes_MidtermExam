import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> songs = [
    'Topia Twins',
    'Fe!n',
    'Field Trip',
    'Violent Crimes',
    'Telephones',
    'MY EYES',
    'SKITZO',
    'Die with a smile',
    'Die for you',
    'slow dancing in the dark',
  ];

  final List<bool> added = List<bool>.filled(10, false);

  void showDetails(int index) {
    print('Details of ${songs[index]}...');
  }

  void addItem(int index) {
    setState(() {
      added[index] = true;
    });
    print('${songs[index]} added...');
    print('Enjoy listening!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song List | Playlist'),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Card(
                  color: added[index] ? Colors.green : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          added[index]
                              ? 'Added to your awesome playlists'
                              : songs[index],
                          style: TextStyle(
                            color: added[index] ? Colors.white : Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => showDetails(index),
                              child: const Text('Details'),
                            ),
                            TextButton(
                              onPressed:
                                  added[index] ? null : () => addItem(index),
                              child: const Text('Add'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
