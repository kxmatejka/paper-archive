import 'package:flutter/material.dart';
import 'package:nav_router/all_routes.dart';
import 'package:nav_router/nav_router.dart';
import 'package:paper_archive/main_pages_navigation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'main_pages_navigation.dart';
import 'pages/print_form.dart';

main() => runApp(PaperArchive());

class PaperArchive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paper archive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPagesNavigation(),
      navigatorKey: navGK,
    );
  }
}

/*
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
      navigatorKey: navGK,
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
  String _name = '';
  String _content = '';

  _setName(String name) => setState(() => _name = name);

  _setContent(String content) => setState(() => _content = content);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              validator: (value) => null,
              onChanged: (text) => _setName(text),
              decoration: InputDecoration(labelText: 'name')),
          TextFormField(
            validator: (value) => null,
            onChanged: (text) => _setContent(text),
            decoration: InputDecoration(labelText: 'content'),
            maxLines: null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
                child: ElevatedButton(
                    onPressed: () => routePush(PrintPdf(_name, _content), RouterType.material),
                    child: Text('Print')
                )
            ),
          ),
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

class PrintPdf extends StatelessWidget {
  final String _name;
  final String _data;

  PrintPdf(this._name, this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PdfPreview(
          build: (format) => _generatePdf(),
    ));
  }

  _generatePdf() {
    String formatedDate = _getCurrentDateInReadableFormat();

    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Flex(children: [
            pw.Flex(
              children: [
                pw.Expanded(child: pw.Text(_name, style: pw.TextStyle(fontSize: 18))),
                pw.Text(formatedDate, style: pw.TextStyle(fontSize: 18))
              ],
              direction: pw.Axis.horizontal,
            ),
            pw.Container(
              margin: pw.EdgeInsets.symmetric(vertical: 20),
              child: pw.Center(
                  child: pw.BarcodeWidget(
                      data: _data,
                      barcode: pw.Barcode.qrCode(),
                      width: 128,
                      height: 128))
            )
          ], direction: pw.Axis.vertical);
        }));

    return doc.save();
  }

  _getCurrentDateInReadableFormat () {
    var now = new DateTime.now();
    return now.day.toString() + '.' + now.month.toString() + '. ' + now.year.toString();
  }
}

class QrCodeScanner extends StatefulWidget {
  @override
  createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QrCodeScanner> {
  Barcode result;
  QRViewController controller;

  @override
  build (BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
}*/
