import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../page_body.dart';
import 'print_preview.dart';

class PrintForm extends StatefulWidget {
  @override
  _PrintFormState createState() => _PrintFormState();
}

class _PrintFormState extends State<PrintForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _content;

  _setName(String name) => setState(() => _name = name);

  _setContent(String content) => setState(() => _content = content);

  @override
  Widget build(BuildContext context) {
    return PageBody(
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                validator: null,
                onChanged: (text) => _setName(text),
                decoration: InputDecoration(labelText: 'name'),
              ),
              TextFormField(
                validator: (value) =>
                    (value!.isEmpty) ? 'Add some content to back up' : null,
                onChanged: (text) => _setContent(text),
                decoration: InputDecoration(labelText: 'content'),
                maxLines: null,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => PrintPreview(_name, _content));
                      }
                    },
                    child: Text('Print'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
