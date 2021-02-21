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
        future: searchImg(this.widget.imgName),
        builder: (context,sh){
          if(sh.hasData && sh.data.length != 0){
            List<String> urls = sh.data;
            return GridView.builder( 
              itemCount: urls.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // get the window width using the context and divide by img width to get num rows
                crossAxisCount: ((MediaQuery.of(context).size.width)/400).floor(),
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0
              ),
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