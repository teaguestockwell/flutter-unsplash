import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as _env;
import 'screens/bn.dart';

void main() async {
  await  _env.load(fileName: ".env");
  runApp(MaterialApp(home: BN(), title: 'LPG Health'));
}

