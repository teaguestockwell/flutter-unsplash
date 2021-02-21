import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

  Future<List<String>> searchImg(String query) async {
    final base = 'https://api.unsplash.com';
    final ep = '/search/photos';
    final params = '?per_page=100&query=${query}';
    final url = base + ep + params;

    final res = await get(
      url,
      headers: {'Authorization': 'Client-ID ${env['UNSPLASH_ACCESS_KEY']}'}
    );

    print('${res.statusCode}: GET $url');

    if(res.statusCode == 200){
      // isolate
      return compute(getUrls, res.body);
    } else{
      return <String>[];
    }
  }

  List<String> getUrls(String body){
    List<String> urlStrings = [];
      final json = jsonDecode(body);
      json['results'].forEach((x) => urlStrings.add(x['urls']['small']));
      print('urls: ' + urlStrings.length.toString());
    return urlStrings;
  }