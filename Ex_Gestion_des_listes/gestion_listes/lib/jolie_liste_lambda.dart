import 'package:flutter/material.dart';

class JolieListeLambda extends StatefulWidget {

  @override
  State<JolieListeLambda> createState() => _JolieListeLambdaState();
}

class _JolieListeLambdaState extends State<JolieListeLambda> {

  List<int> items = [];

  @override
  Widget build(BuildContext context) {

    items = List<int>.generate(15, (i) => _fibonacci(i));
    return Scaffold(
      appBar: AppBar(
        title: Text("JolieListeLambda"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: _itemContainer(context, items, index),
            );
          }
      )
    );
  }

  // @override
  // void initState() {
  //   items = List<int>.generate(15, (i) => _fibonacci(i));
  //   setState(() {});
  // }
}

int _fibonacci(int n){
  if( n == 0 || n == 1 ){
    return n;
  }
  return _fibonacci(n - 1) + _fibonacci(n - 2);
}

Widget _itemContainer(BuildContext context,List<int> items, int index){
  return Container(
    height: 75,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Theme.of(context).colorScheme.secondaryContainer
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(items[index].toString(), style: Theme.of(context).textTheme.headlineSmall),
      ],
    ),
  );
}