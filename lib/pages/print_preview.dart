import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintPreview extends StatelessWidget {
  final String _name;
  final String _data;

  PrintPreview(this._name, this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => _generatePdf(),
      ),
    );
  }

  _generatePdf() {
    String formatedDate = _getCurrentDateInReadableFormat();
    final doc = pw.Document();

    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Flex(
            children: [
              pw.Flex(
                children: [
                  pw.Expanded(
                    child: pw.Text(
                      _name,
                      style: pw.TextStyle(fontSize: 18),
                    ),
                  ),
                  pw.Text(
                    formatedDate,
                    style: pw.TextStyle(fontSize: 18),
                  ),
                ],
                direction: pw.Axis.horizontal,
              ),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 20),
                child: pw.Center(
                  child: pw.BarcodeWidget(
                    data: _data,
                    barcode: pw.Barcode.qrCode(),
                    width: 256,
                    height: 256,
                  ),
                ),
              ),
            ],
            direction: pw.Axis.vertical,
          );
        }));

    return doc.save();
  }

  _getCurrentDateInReadableFormat() {
    var now = new DateTime.now();
    return now.day.toString() +
        '.' +
        now.month.toString() +
        '. ' +
        now.year.toString();
  }
}
