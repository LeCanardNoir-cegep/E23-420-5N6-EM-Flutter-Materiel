
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImage{
  static Widget get(int? width){
    String param = (width != null) ? "?width=${width!.toStringAsFixed(0)}" : "";

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: "https://4n6.azurewebsites.net/exos/image$param",
            progressIndicatorBuilder: (context, url, download) => Center(child: CircularProgressIndicator(value: download.progress)),
            errorWidget: (context, url, error) => Center(child: Column(children: [Icon(Icons.error_outline), Text(error)],),),
          )
        ],
      ),
    );
  }
}