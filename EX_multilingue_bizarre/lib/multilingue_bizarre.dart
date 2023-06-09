import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MultilingueBizarre extends StatefulWidget {
  const MultilingueBizarre({super.key, required this.title});
  final String title;

  @override
  State<MultilingueBizarre> createState() => _MultilingueBizarreState();
}

class _MultilingueBizarreState extends State<MultilingueBizarre> {

  List<Image> catList = [];

  @override
  Widget build(BuildContext context) {

    for(int i = 1; i < 5; i++) {
      catList.add(Image.asset('assets/images/cat'+ i.toString() + '.jpg',fit: BoxFit.fill,));
    }

    print(catList);

    var txt = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(txt.appName),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(txt.listChatFav, style: Theme.of(context).textTheme.titleLarge),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 50/60,
                  children: [
                    MyCard(img: catList[0], title: txt.cat1),
                    MyCard(img: catList[1], title: txt.cat2),
                    MyCard(img: catList[2], title: txt.cat3),
                    MyCard(img: catList[3], title: txt.cat4),
                  ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  const MyCard({super.key, required this.img, required this.title});
  final Image img;
  final String title;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text( widget.title , textAlign: TextAlign.center, style: Theme.of(context).primaryTextTheme.titleMedium,),
              Container(height: 125, width: 125,child: widget.img),
            ],
          ),
        )
    );
  }
}
