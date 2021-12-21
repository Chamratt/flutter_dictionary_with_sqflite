import 'package:dictionary/database_helper.dart';
import 'package:dictionary/model/dictionary.dart';
import 'package:dictionary/screen/definition_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper? databaseHelper = DatabaseHelper.instance;
  List<Dictionary>? dictionary = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseHelper!.getAllWord().then((row) {
      setState(() {
        for (var element in row!) {
          dictionary!.add(Dictionary.fromMapObject(element));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Dictionary'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Scrollbar(
          showTrackOnHover: true,
          isAlwaysShown: true,
          radius: const Radius.circular(50),
          child: ListView.builder(
            itemCount: dictionary!.length,
            padding: const EdgeInsets.all(14),
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey.shade100,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DefinitionScreen(
                                  dictionary: dictionary![index],
                                )));
                  },
                  title: Text(
                    '${dictionary![index].word}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('${dictionary![index].wordtype}'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
