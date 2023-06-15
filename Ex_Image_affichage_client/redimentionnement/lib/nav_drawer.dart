import 'package:flutter/material.dart';
import 'package:redimentionnement/app_router.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  List<Widget> menu = [];

  void _buildRouteMenu(){
    var routes = AppRouter.routes;
    menu.add(const DrawerHeader(child: Text("test")));
    routes.forEach((key, value) {
      menu.add(
          ListTile(
              title: Text(AppRouter.translation[key]!),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: value));
              }
          )
      );
    });
  }

  @override
  void initState() {
    _buildRouteMenu();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: menu,
      ),
    );
  }

}
