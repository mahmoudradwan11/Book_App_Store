import 'package:book_app_store/modules/web_view/web.dart';
import 'package:book_app_store/shared/components/components.dart';
import 'package:book_app_store/shared/style/colors.dart';
import 'package:flutter/material.dart';
class BookDetails extends StatelessWidget {
  var model;
  BookDetails({Key? key,this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
               Align(
                 alignment: AlignmentDirectional.center,
                 child: Container(
                  // height: 300,
                   width: 200,
                   child: Image(image:NetworkImage(model.bookImage),
                    // height:200,
                   ),
                 ),
               ),
               const SizedBox(height: 20,),
               Text(model.bookName,
                 style:const TextStyle(
                     color:defaultColor,
                     fontFamily:'Jannah',
                     fontSize: 25),
               ),
              //const SizedBox(height: 2,),
              Text(model.author,
                style:const TextStyle(
                    color:Colors.black,
                    fontFamily:'Jannah',
                    fontSize: 20),
              ),
              Text(model.description,
                style:TextStyle(
                    color:Colors.grey[600],
                    fontFamily:'Jannah',
                    fontSize: 15),
              ),
              const SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: const Center(
                        child: Text(
                          'Price',
                          style:TextStyle(
                              color:Colors.black,
                              fontFamily:'Jannah',
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: const Center(
                        child: Text(
                          'Year',
                          style:TextStyle(
                              color:Colors.black,
                              fontFamily:'Jannah',
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: const Center(
                        child: Text(
                          'Rite',
                          style:TextStyle(
                              color:Colors.black,
                              fontFamily:'Jannah',
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          model.price,
                          style:TextStyle(
                              color:Colors.grey[600],
                              fontFamily:'Jannah',
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          model.year,
                          style:TextStyle(
                              color:Colors.grey[600],
                              fontFamily:'Jannah',
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          model.rite,
                          style:TextStyle(
                              color:Colors.grey[600],
                              fontFamily:'Jannah',
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Center(child: MaterialButton(onPressed:(){
                navigateTo(context, Webview(model.link));
              },color: Colors.cyan,child:const Text('See More',style: TextStyle(color: Colors.white),),))
            ],
          ),
        ),
      ),
    );
  }
}
