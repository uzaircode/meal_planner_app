import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFormFieldItem extends StatefulWidget {
  String label;
  TextInputType textInput;
  IconData icon;

  TextFormFieldItem(this.label, this.textInput, this.icon);

  @override
  State<TextFormFieldItem> createState() => _TextFormFieldItemState();
}

class _TextFormFieldItemState extends State<TextFormFieldItem> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Color.fromRGBO(148, 157, 164, 1.0),
          fontSize: 17,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(234, 236, 242, 1.0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: new BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        errorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        errorStyle: TextStyle(
          fontSize: 14.0,
        ),
        focusedErrorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
      // textInputAction: widget.textInput,
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty || value.length < 5) {
          return 'Password is too short!';
        }
      },
      onSaved: (value) {
        // _authData['password'] = value;
      },
    );
  }
}
