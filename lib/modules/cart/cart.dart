import 'package:book_app_store/models/Health_model/health_model.dart';
import 'package:book_app_store/shared/components/components.dart';
import 'package:book_app_store/shared/cubit/cubit.dart';
import 'package:book_app_store/shared/cubit/states.dart';
import 'package:book_app_store/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CartBooks extends StatelessWidget {
  const CartBooks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookStoreCubit,BookStoreStates>(
      listener:(context,state){},
      builder:(context,state) {
        var cubit = BookStoreCubit.get(context);
        var cart = cubit.cart;
        if (cart.isEmpty) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Add Some Cart Item',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        builtCartItem(cart[index], context),
                    separatorBuilder: (context, index) => builtDivider(),
                    itemCount: cart.length)
            ),
          );
        }
      }
        );
  }
  Widget builtCartItem(Map model, context) => InkWell(
    onTap: (){},
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child:Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(model['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model['name'],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    model['des'],
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    model['author'],
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: defaultColor,
                    child:Text(
                      model['year'],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(model['price']),
                      const Spacer(),
                      IconButton(onPressed:(){
                        BookStoreCubit.get(context).deleteCart(id:model['id']);
                        showToast('Deleted Successfully',ToastStates.ERROR);
                      }, icon:const Icon(Icons.restore_from_trash))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
