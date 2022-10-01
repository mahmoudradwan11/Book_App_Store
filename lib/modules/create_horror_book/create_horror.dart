import 'package:book_app_store/shared/components/components.dart';
import 'package:book_app_store/shared/cubit/cubit.dart';
import 'package:book_app_store/shared/cubit/states.dart';
import 'package:book_app_store/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CreateHorrorBook extends StatelessWidget {
  CreateHorrorBook({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController priceController= TextEditingController();
  TextEditingController riteController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookStoreCubit,BookStoreStates>(
        listener:(context,state){},
        builder:(context,state) {
          var cubit = BookStoreCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor:defaultColor,
              title: const Text('Create Horror Book'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    buildTextForm(
                      context,
                      buttonController: nameController,
                      title: 'BookName',
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    PVSpace20,
                    buildTextForm(
                      context,
                      buttonController: descriptionController,
                      title: 'Description',
                      MediaQuery.of(context).size.height * 0.22,
                    ),
                    PVSpace20,
                    buildTextForm(
                      context,
                      buttonController: authorController,
                      title: 'Author',
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    PVSpace20,
                    buildTextForm(
                      context,
                      buttonController: yearController,
                      title: 'Year',
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    PVSpace20,
                    buildTextForm(
                      context,
                      buttonController: priceController,
                      title: 'Price',
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    PVSpace20,
                    buildTextForm(
                      context,
                      buttonController: riteController,
                      title: 'Rite',
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    PVSpace20,
                    defButton(function:(){
                      cubit.createHorrorBook(
                          bookName: nameController.text,
                          description:descriptionController.text,
                          author: authorController.text,
                          year: yearController.text,
                          rite: riteController.text,
                          price:priceController.text
                      );
                      showToast('Book Added Successfully', ToastStates.SUCCESS);
                    }, text:'Create'
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}