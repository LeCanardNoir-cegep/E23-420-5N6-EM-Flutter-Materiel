import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:plein_de_tailles/my_card.dart';
import 'my_image.dart';

class PortraitScreen extends StatefulWidget {
  const PortraitScreen({super.key, required this.title});
  final String title;

  @override
  State<PortraitScreen> createState() => _PortraitScreenState();
}

class _PortraitScreenState extends State<PortraitScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(widget.title, maxLines: 1, maxFontSize: 18, minFontSize: 10,),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.passthrough,
        children: [
          ConstrainedBox(constraints: BoxConstraints.expand(),child: MyImage()),
          MyCard()
        ],
      ),
    );
  }
}
