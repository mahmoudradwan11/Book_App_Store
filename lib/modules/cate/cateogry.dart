import 'package:book_app_store/modules/Health_Books/health_book.dart';
import 'package:book_app_store/modules/Manga-Books/mango_books.dart';
import 'package:book_app_store/modules/Sports_books/sports_books.dart';
import 'package:book_app_store/modules/horror_books/horror_books.dart';
import 'package:book_app_store/modules/programming_books/programming_books.dart';
import 'package:book_app_store/modules/science_books/science_books.dart';
import 'package:book_app_store/shared/components/components.dart';
import 'package:book_app_store/shared/cubit/cubit.dart';
import 'package:book_app_store/shared/cubit/states.dart';
import 'package:book_app_store/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookStoreCubit, BookStoreStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, const MangaBooks());
                          },
                          child: Container(
                            height: 200,
                            color: defaultColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Image(
                                  image: AssetImage('images/manga2.png'),
                                  //height: 250,
                                  //width:200,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Manga Books',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Jannah'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, const HealthBooks());
                          },
                          child: Container(
                            height: 200,
                            color: defaultColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Image(
                                  image: AssetImage('images/E.png'),
                                  height: 113,
                                  //width:200,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Health Books',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Jannah'),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, const ScienceBooks());
                          },
                          child: Container(
                            height: 200,
                            color: defaultColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Image(
                                  image: AssetImage('images/science.png'),
                                  //height: 250,
                                  //width:200,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: 28,
                                ),
                                Text(
                                  'Science Books',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Jannah'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, const SportsBooks());
                          },
                          child: Container(
                            height: 200,
                            color: defaultColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Image(
                                  image: AssetImage('images/P.png'),
                                  height: 105,
                                  //width:200,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 28,
                                ),
                                Text(
                                  'Sports Books',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Jannah'),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, const ProgrammingBooks());
                          },
                          child: Container(
                            height: 200,
                           // width: 155,
                            color: defaultColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Image(
                                  image: AssetImage('images/program.png'),
                                  //height: 100,
                                  width:double.infinity,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: 28,
                                ),
                                Text(
                                  'Programming Books',
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'Jannah'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, const HorrorBooks());
                          },
                          child: Container(
                            height: 200,
                            color: defaultColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Image(
                                  image: AssetImage('images/horror.png'),
                                  height: 116,
                                  //width:200,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 28,
                                ),
                                Text(
                                  'Horror Books',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Jannah'),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
