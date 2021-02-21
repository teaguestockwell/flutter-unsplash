import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';
import '../service.dart';

class ListImage extends StatefulWidget {
  final String imgName;
  ListImage(this.imgName);
  @override
  _ListImageState createState() => _ListImageState();
}

class _ListImageState extends State<ListImage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<String>>(
        initialData: <String>[],
        future: Service.searchImg(this.widget.imgName),
        builder: (_,sh){
          if(sh.hasData && sh.data.length != 0){
            List<String> urls = sh.data;
            return ListView.builder( itemCount: urls.length,
              itemBuilder: (_,i){
                return FadeInImage.memoryNetwork(
                  imageCacheWidth: 400,
                  placeholder: kTransparentImage,
                  image: urls[i]
                );
              },
            );
          } else{
            return CircularProgressIndicator();
          }
        } 
      )
    );
  }
}