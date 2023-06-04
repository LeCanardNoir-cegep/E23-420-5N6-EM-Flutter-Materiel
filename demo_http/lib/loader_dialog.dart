import 'package:flutter/material.dart';

class LoaderDialog{
  BuildContext context;
  LoaderDialog(this.context){
    _show();
  }

  void _show(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Loading..."),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}