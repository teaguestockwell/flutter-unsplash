import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as _env;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/bn.dart';
import 'utils/constant.dart';

void main() async {
  try{
    await  _env.load(fileName: ".env");
    apiKey = env['UNSPLASH_ACCESS_KEY'];
  // ignore: avoid_catches_without_on_clauses
  } catch(e){
    apiKey = const String.fromEnvironment('UNSPLASH_ACCESS_KEY');
  }
  runApp(MaterialApp(home: BN(), title: 'LPG Health'));
}

