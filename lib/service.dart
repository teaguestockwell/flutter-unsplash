import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;



class Service {
  static final String base = 'https://api.unsplash.com';
  static Future<List<String>> searchImg(String imgName) async {
    final ep = '${base}/photos?page=1&?query=${imgName}&client_id=${env['UNSPLASH_ACCESS_KEY']}';

    print('fetching data from: ${ep}');

    final res = await http.get(ep);

    print(res.statusCode);

    if(res.statusCode == 200){
      final List<dynamic> json = convert.jsonDecode(res.body);
      print(json);
      final List<String> urls = [];
      json.forEach((x) => urls.add(x['urls']['small']));
      print(urls);
      return urls;
    } else{
      return <String>[];
    }
  }
}


