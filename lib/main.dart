import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:book_app_store/modules/login/login.dart';
import 'package:book_app_store/shared/components/end_points.dart';
import 'package:book_app_store/shared/cubit/cubit.dart';
import 'package:book_app_store/shared/cubit/states.dart';
import 'package:book_app_store/shared/network/local/cache_helper.dart';
import 'package:book_app_store/shared/style/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  UserID = CacheHelper.getData(key: 'uId');
  print('USERID = $UserID');
  Widget? widget;
  if (UserID != null) {
    widget = const Home();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({Key? key, this.startWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookStoreCubit()
        ..getMangaBooks()
        ..getHealthBooks()
        ..getScienceBooks()
        ..getSportsBooks()
        ..getProgrammingBooks()
        ..getHorrorBooks()
        ..createDatabase()
        ..getUserData(),
      child: BlocConsumer<BookStoreCubit, BookStoreStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'BookStore',
            theme: lightTheme,
            themeMode: ThemeMode.light,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(
              splash: Stack(
                children: const [
                  Image(
                    fit: BoxFit.cover,
                    width: 300,
                    image: AssetImage('images/app-icon.png'),
                  ),
                ],
              ),
              duration: 3000,
              nextScreen: startWidget!,
              splashTransition: SplashTransition.scaleTransition,
              backgroundColor: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
