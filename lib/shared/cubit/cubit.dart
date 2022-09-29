import 'package:book_app_store/models/Health_model/health_model.dart';
import 'package:book_app_store/models/Manga_model/manga_model.dart';
import 'package:book_app_store/models/Science-model/science_model.dart';
import 'package:book_app_store/models/Sports-model/Sports_model.dart';
import 'package:book_app_store/models/User/user.dart';
import 'package:book_app_store/modules/cart/cart.dart';
import 'package:book_app_store/modules/cate/cateogry.dart';
import 'package:book_app_store/modules/profile/profile.dart';
import 'package:book_app_store/shared/components/end_points.dart';
import 'package:book_app_store/shared/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
class BookStoreCubit extends Cubit<BookStoreStates> {
  BookStoreCubit() : super(InitState());

  static BookStoreCubit get(context) => BlocProvider.of(context);
  int screenIndex = 0;
  Database? database;
  List<Map> cart = [];
  List<MangaModel> mangaBooks = [];
  List<HealthModel> healthBooks = [];
  List<ScienceModel> scienceBooks = [];
  List<SportsModel> sportsBooks = [];
  List<Widget> screens = [
    const Category(),
    const CartBooks(),
    const Profile(),
  ];
  List<String> titles = ['Category', 'Cart', 'Profile'];
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.category,
        ),
        label: 'Category'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.offline_share,
        ),
        label: 'Cart'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: 'Profile'),
  ];
  void changeIndex(int index) {
    screenIndex = index;
    emit(ChangeScreen());
  }
  UserData? userModel;
  bool dark = true;
  String? name;
  String? email;
  String? image;

  void getUserData() {
    FirebaseFirestore.instance.collection('Users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserData.fromJson(value.data()!);
      name = userModel!.name;
      email = userModel!.email;
      emit(GetUserSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetUserErrorState(error.toString()));
    });
  }
  void createDatabase() {
    openDatabase('BOOKSTORE.db', version: 1, onCreate: (database, version) {
      print('DataBase Created');
      database
          .execute(
          'create table Cart(id INTEGER PRIMARY KEY,name TEXT , des TEXT , price TEXT,image TEXT,author TEXT,year TEXT)')
          .then((value) {
        print('Table 1 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
    }, onOpen: (database) {
      getCart(database);
      print('Database opened');
    }).then((value) {
      database = value;
      emit(CreateDataBaseState());
    }).catchError((error) {
      emit(ErrorCreateDataBaseState());
    });
  }
  Future<void> insertCart({
    required String name,
    required String des,
    required String price,
    required String image,
    required String author,
    required String year,
  }) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO Cart(name,des,price,image,author,year) VALUES("$name","$des","$price","$image","$author","$year")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertCartState());
        getCart(database);
        //print()
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorInsertCartState());
      });
    });
  }
  void getCart(database) {
    cart = [];
    database!.rawQuery('select * from Cart').then((value) {
      value.forEach((element) {
        cart.add(element);
      });
      print(cart);
      emit(GetCartState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorGetCartState());
    });
  }
  void deleteCart({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Cart WHERE id= ?', [id]).then((value) {
      getCart(database);
      emit(DeleteCartState());
    });
  }
  void createMangaBook({
    required String bookName,
    required String description,
    String? link,
    required String author,
    required String year,
    required String rite,
    required String price,
    String? bookImage,
  }) {
    emit(CreateMangaBookLoadingState());
    MangaModel model = MangaModel(
        bookName: bookName,
        bookImage: bookImage ?? '',
        author: author,
        link: link ?? '',
        description: description,
        year: year,
        rite: rite,
        price: price);
    FirebaseFirestore.instance
        .collection('MangaBooks')
        .add(model.toMap())
        .then((value) {
      emit(CreateMangaBookState());
    }).catchError((error) {
      emit(CreateMangaBookErrorState());
    });
  }

  void createHealthBook({
    required String bookName,
    required String description,
    String? link,
    required String author,
    required String year,
    required String rite,
    required String price,
    String? bookImage,
  }) {
    emit(CreateHealthBookLoadingState());
    HealthModel model = HealthModel(
        bookName: bookName,
        bookImage: bookImage ?? '',
        author: author,
        link: link ?? '',
        description: description,
        year: year,
        rite: rite,
        price: price);
    FirebaseFirestore.instance
        .collection('HealthBooks')
        .add(model.toMap())
        .then((value) {
      emit(CreateHealthBookState());
    }).catchError((error) {
      emit(CreateHealthBookErrorState());
    });
  }

  void createScienceBook({
    required String bookName,
    required String description,
    String? link,
    required String author,
    required String year,
    required String rite,
    required String price,
    String? bookImage,
  }) {
    emit(CreateScienceBookLoadingState());
    ScienceModel model = ScienceModel(
        bookName: bookName,
        bookImage: bookImage ?? '',
        author: author,
        link: link ?? '',
        description: description,
        year: year,
        rite: rite,
        price: price);
    FirebaseFirestore.instance
        .collection('ScienceBooks')
        .add(model.toMap())
        .then((value) {
      emit(CreateScienceBookState());
    }).catchError((error) {
      emit(CreateScienceBookErrorState());
    });
  }

  void createSportsBook({
    required String bookName,
    required String description,
    String? link,
    required String author,
    required String year,
    required String rite,
    required String price,
    String? bookImage,
  }) {
    emit(CreateHealthBookLoadingState());
    SportsModel model = SportsModel(
        bookName: bookName,
        bookImage: bookImage ?? '',
        author: author,
        link: link ?? '',
        description: description,
        year: year,
        rite: rite,
        price: price);
    FirebaseFirestore.instance
        .collection('SportsBooks')
        .add(model.toMap())
        .then((value) {
      emit(CreateHealthBookState());
    }).catchError((error) {
      emit(CreateHealthBookErrorState());
    });
  }

  void getMangaBooks() {
    emit(GetMangaBookLoadingState());
    FirebaseFirestore.instance.collection('MangaBooks').get().then((value) {
      mangaBooks = [];
      value.docs.forEach((element) {
        mangaBooks.add(MangaModel.fromJson(element.data()));
      });
      emit(GetMangaBookState());
      print(mangaBooks.length);
    }).catchError((error) {
      emit(GetMangaBookErrorState());
    });
  }

  void getHealthBooks() {
    emit(GetHealthBookLoadingState());
    FirebaseFirestore.instance.collection('HealthBooks').get().then((value) {
      healthBooks = [];
      value.docs.forEach((element) {
        healthBooks.add(HealthModel.fromJson(element.data()));
      });
      emit(GetHealthBookState());
      print(healthBooks.length);
    }).catchError((error) {
      emit(GetHealthBookErrorState());
    });
  }

  void getSportsBooks() {
    emit(GetSportsBookLoadingState());
    FirebaseFirestore.instance.collection('SportsBooks').get().then((value) {
      sportsBooks = [];
      value.docs.forEach((element) {
        sportsBooks.add(SportsModel.fromJson(element.data()));
      });
      emit(GetSportsBookState());
      print(sportsBooks.length);
    }).catchError((error) {
      emit(GetSportsBookErrorState());
    });
  }

  void getScienceBooks() {
    emit(GetScienceBookLoadingState());
    FirebaseFirestore.instance.collection('ScienceBooks').get().then((value) {
      scienceBooks = [];
      value.docs.forEach((element) {
        scienceBooks.add(ScienceModel.fromJson(element.data()));
      });
      emit(GetScienceBookState());
      print(scienceBooks.length);
    }).catchError((error) {
      emit(GetScienceBookErrorState());
    });
  }
}
