import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../utils/lorem_ipsum.dart';

class Ipsum extends StatelessWidget {
  final String txt;
  Ipsum(this.txt);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      child: Center(child:AutoSizeText(loremIpsum[txt]))
    );
  }
}