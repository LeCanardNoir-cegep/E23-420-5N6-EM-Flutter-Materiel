import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:redimentionnement/my_image.dart';
import 'package:redimentionnement/nav_drawer.dart';

class PageTier extends StatefulWidget {
  const PageTier({super.key, required this.title});

  final String title;

  @override
  State<PageTier> createState() => _PageTierState();
}

class _PageTierState extends State<PageTier> {

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 3).toStringAsFixed(0);
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 3,
            child: CachedNetworkImage(
              imageUrl: "https://4n6.azurewebsites.net/exos/image?width=$width",
              progressIndicatorBuilder: (context, url, download) => Center(child: CircularProgressIndicator(value: download.progress)),
              errorWidget: (context, url, error) => Center(child: Column(children: [Icon(Icons.error_outline), Text(error)],),),
              fit: BoxFit.fill,
            ),
          ),
        )
    );
  }
}
