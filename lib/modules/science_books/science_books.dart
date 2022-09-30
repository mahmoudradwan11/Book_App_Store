import 'package:book_app_store/models/Science-model/science_model.dart';
import 'package:book_app_store/modules/book_details/book_details.dart';
import 'package:book_app_store/shared/components/components.dart';
import 'package:book_app_store/shared/cubit/cubit.dart';
import 'package:book_app_store/shared/cubit/states.dart';
import 'package:book_app_store/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceBooks extends StatelessWidget {
  const ScienceBooks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookStoreCubit, BookStoreStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BookStoreCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
            title: const Text('Science Books'),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemBuilder: (context, index) =>
                builtScienceItem(cubit.scienceBooks[index], context),
            separatorBuilder: (context, index) => builtDivider(),
            itemCount: cubit.scienceBooks.length,
          ),
        );
      },
    );
  }

  Widget builtScienceItem(ScienceModel model, context) => InkWell(
    onTap: (){
      navigateTo(context,BookDetails(model: model,)
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child:Container(
        color: Colors.grey[200],
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${model.bookImage}'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 153,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.bookName}',
                      style:const TextStyle(fontFamily: 'Jannah',fontSize: 15,fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          color: defaultColor.shade300,
                          child:Text('${model.year}'),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '${model.price}',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.star,color: Colors.yellow,),
                        Text(
                          '${model.rite}',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height:5),
                    Text(
                      '${model.description}',
                      style:  TextStyle(
                        color: Colors.grey[800],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '${model.author}',
                            style:  TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(onPressed:(){
                          BookStoreCubit.get(context).insertCart(
                              name: model.bookName!,
                              des: model.description!,
                              price: model.price!,
                              image: model.bookImage!,
                              author: model.author!,
                              year:model.year!
                          );
                          showToast('Added ', ToastStates.SUCCESS);
                        }, icon:const Icon(Icons.favorite,color: Colors.cyan,)
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
