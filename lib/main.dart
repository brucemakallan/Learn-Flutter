import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsSate createState() => RandomWordsSate();
}

class RandomWordsSate extends State<RandomWords> {
  final _textStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 80),
    fontSize: 17.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First App'),
      ),
      body: _buildWordsList(),
    );
  }

  Widget _processError(url, error) {
    print(error);
    print(url);
    return Icon(
        Icons.error,
        color: Color.fromARGB(255, 200, 0, 0),
        size: 50.0,
    );
  }

  Container _wrapInContainer(Widget childWidget) => Container(
        margin: const EdgeInsets.all(10.0),
        child: childWidget,
      );

  String _generateRandomParagraph() {
    String paragraph = "";
    generateWordPairs().take(4).forEach((w) => paragraph += "${w.asString} ");
    return paragraph;
  }

  Widget _buildWordsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, i) => Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl:
                      "https://picsum.photos/id/${Random().nextInt(1000)}/600/300",
                  placeholder: (context, url) =>
                      _wrapInContainer(CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      _wrapInContainer(_processError(url, error)),
                ),
                ListTile(
                  leading: Text(
                    "${_generateRandomParagraph()}",
                    style: _textStyle,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
