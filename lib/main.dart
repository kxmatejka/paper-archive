import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class BackupForm extends StatefulWidget {
  @override
  BackupFromState createState() => BackupFromState();
}

class BackupFromState extends State<BackupForm> {
  final _formKey = GlobalKey<FormState>();
  String _content = '';

  void _setContent (String content) {
    setState(() {
      _content = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) => null,
            decoration: InputDecoration(
                labelText: 'name'
            )),
          TextFormField(
            validator: (value) => null,
            onChanged: (text) => _setContent(text),
            decoration: InputDecoration(
              labelText: 'content'
            ),
            maxLines: null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                onPressed: () => print('press'), child: Text('Submit!')),
          ),
          QrImage(
            data: _content,
            version: QrVersions.auto,
            size: 200,
          )
        ],
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Paper Archive'),
        ),
        body: BackupForm());
  }
}
