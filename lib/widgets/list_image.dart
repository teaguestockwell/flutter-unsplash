import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';
import '../utils/service.dart';
import 'ipsum.dart';

class ListImage extends StatefulWidget {
  final String imgName;
  ListImage(this.imgName);
  @override
  _ListImageState createState() => _ListImageState();
}

class _ListImageState extends State<ListImage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: FutureBuilder<List<String>>(
          initialData: <String>[],
          future: searchImg(this.widget.imgName),
          builder: (context,sh){
            if(sh.hasData && sh.data.length != 0){
              List<String> urls = sh.data;
              return GridView.builder( 
                padding: EdgeInsets.all(8),
                itemCount: urls.length+1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // get the window width using the context and divide by img width to get num rows
                  crossAxisCount: ((MediaQuery.of(context).size.width)/420).floor(),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0
                ),
                itemBuilder: (_,i){
                  if(i == 0){return Ipsum(this.widget.imgName);}
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage.memoryNetwork(
                      height: 400,
                      width: 400,
                      fit: BoxFit.cover,
                      imageCacheWidth: 400,
                      placeholder: kTransparentImage,
                      image: urls[i-1]
                    )
                  );
                },
              );
            } else{
              return CircularProgressIndicator();
            }
          } 
        )
      ),
    );
  }
}