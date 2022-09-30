import 'package:book_app_store/modules/create_health_book/create_health.dart';
import 'package:book_app_store/modules/create_manga_book/create_manga.dart';
import 'package:book_app_store/modules/create_programming_book/create_programming_book.dart';
import 'package:book_app_store/modules/create_science_book/create_science.dart';
import 'package:book_app_store/modules/create_sports_book/create_sports.dart';
import 'package:book_app_store/shared/components/components.dart';
import 'package:book_app_store/shared/cubit/cubit.dart';
import 'package:book_app_store/shared/cubit/states.dart';
import 'package:book_app_store/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// this screen was written bu Eng Mahmoud
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookStoreCubit, BookStoreStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BookStoreCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:Text(
                cubit.titles[cubit.screenIndex],
                style:const TextStyle(
                  fontSize: 20,
                  color: defaultColor,
                ),
              ),
            ),
            drawer: Drawer(
              // backgroundColor: defaultColor,
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text('${cubit.name}'),
                    accountEmail: Text('${cubit.email}'),
                  ),
                  ListTile(
                    title: const Text('Create Manga Book'),
                    leading: const Icon(Icons.book),
                    onTap: () {
                      navigateTo(context, CreateMangaBook());
                    },
                  ),
                  ListTile(
                    title: const Text('Create Programming Book'),
                    leading: const Icon(Icons.book),
                    onTap: () {
                      navigateTo(context, CreateProgrammingBook());
                    },
                  ),
                  ListTile(
                    title: const Text('Create Science Book'),
                    leading: const Icon(Icons.science),
                    onTap: () {
                      navigateTo(context, CreateScienceBook());
                    },
                  ),
                  ListTile(
                    title: const Text('Create Sports Book'),
                    leading: const Icon(Icons.sports),
                    onTap: () {
                      navigateTo(context, CreateSportsBook());
                    },
                  ),
                  ListTile(
                    title: const Text('Create Health Book'),
                    leading: const Icon(Icons.health_and_safety),
                    onTap: () {
                      navigateTo(context, CreateHealthBook());
                    },
                  ),
                ],
              ),
            ),
            body: cubit.screens[cubit.screenIndex],
            bottomNavigationBar:BottomNavigationBar(
              items:cubit.items,
              currentIndex: cubit.screenIndex,
              onTap:(index){
                cubit.changeIndex(index);
              },
            ),
          );
        });
  }
}

