import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/web_view.dart';

Widget BuildArtical(context, artical) => InkWell(

      onTap: () {
        Navigate(
            context,
            webview(
              web: artical['url'],
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),),
                child: CachedNetworkImage(
                  imageUrl:'${artical['urlToImage']}',
                  placeholder: (context,url) =>  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Image(image: NetworkImage('https://www.toolworld.in/storage/media/product/noimage.png')),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      '${artical['title']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Text('${artical['publishedAt']}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget Seperate() => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.orangeAccent,
            width: 2,
          ),
        ),
        color: Colors.orangeAccent,
      )),
    );

void Navigate(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void navigateandfinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget),(rout) {
      return false ;
},);
