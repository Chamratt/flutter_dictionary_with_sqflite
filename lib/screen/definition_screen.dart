import 'package:dictionary/model/dictionary.dart';
import 'package:flutter/material.dart';

import '../database_helper.dart';

class DefinitionScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  DefinitionScreen({this.dictionary});
  Dictionary? dictionary;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${dictionary!.word}'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              '${dictionary!.wordtype}',
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('${dictionary!.definition}'),
          ],
        ),
      ),
    );
  }
}
