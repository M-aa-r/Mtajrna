import 'package:flutter/material.dart';
import 'package:mtjry/models/store.dart';
import 'package:mtjry/screens/info.dart';
import 'category/categories_screen.dart';
import '../screens/favorites_screen.dart';
//import '../models/store.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({Key? key}) : super(key: key);

  final List<Store> favoriteStores;

  const TabsScreen(this.favoriteStores, {Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;
  late List<Map> _screens;

  @override
  void initState() {
    _screens = [
      {
        'Screen': const CategoriesScreen(),
        'Title': 'الفئات',
      },
      {
        'Screen': FavoritesScreen(widget.favoriteStores),
        'Title': 'المتاجر المفضلة',
      },
      {
        'Screen': Info(),
        'Title': 'القائمة',
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(_screens[_selectedScreenIndex]['Title'] as String),
        ),
        body: _screens[_selectedScreenIndex]['Screen'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,

          backgroundColor: Color.fromRGBO(63, 81, 181, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.5),
          currentIndex: _selectedScreenIndex,
          unselectedLabelStyle: TextStyle(
            fontFamily: 'ElMessiri',
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: ' الفئات ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: ' المتاجر المفضلة ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'القائمة',
            ),
          ],
          selectedLabelStyle: TextStyle(
            fontFamily: 'ElMessiri',
          ),
          // selectedItemColor: Colors.red,
        ),
        /*  items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: ' الفئات ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: ' المتاجر المفضلة ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'القائمة', 
              
             
            ),
            
          ],
          
        ),*/
      );
}
