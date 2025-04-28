//import 'package:firebase_core/firebase_core.dart';
//import 'package:bloc/bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:mtjry/app_data.dart';
import 'package:mtjry/login/cubit/cubit.dart';
import 'package:mtjry/models/store.dart';

//import 'package:mtjry/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mtjry/screens/category/cubit/category_cubit.dart';
import 'package:mtjry/screens/store_screen/category_stores_screens.dart';
import 'package:mtjry/screens/store_screen/cubit/store_cubit.dart';

//import 'screens/category_stores_screens.dart';
import 'core/componant/bloc_observer.dart';
import 'firebase_options.dart';
import 'screens/tabs_screen.dart';
//import 'widgets/store_item.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);


  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();



  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (BuildContext context) => CategoryCubit()),
    BlocProvider(create: (BuildContext context) => StoreCubit()),
    BlocProvider(create: (BuildContext context) => AuthCubit()),
  ], child: const MainPage()));
}
/*
Future<void> main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainPage());
}*/

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

//من خلال الكود في الاسفل اول خطوة قمت بأنشائها لاجل صفحة المفضلة
class MyApp extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser?.uid != null) return;
    AuthCubit.get(context).userSkip(
      favorite: [],
    );
  }

  List<Store> favoriteStore = [];

  void manageFavorite(String storeId) {
    final existingIndex =
        favoriteStore.indexWhere((store) => store.id == storeId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteStore.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteStore.add(StoreCubit.get(context)
            .storeData
            .firstWhere((store) => store.id == storeId));
      });
    }
  }

  bool isFavorite(String id) {
    return favoriteStore.any((store) => store.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      title: 'متاجر السعودية',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headlineSmall: const TextStyle(
                  color: Color.fromRGBO(63, 81, 181, 1),
                  fontSize: 26,
                  fontFamily: 'ElMessiri',
                ),
                titleLarge: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'ElMessiri',
                ),
              )),
      // home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favoriteStore),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(manageFavorite, isFavorite),
      },
    );
  }
}

