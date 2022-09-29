import 'package:book_app_store/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Widget builtDivider() => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    color: Colors.white,
    height: 1.0,
    width: double.infinity,
  ),
);

Widget logo() {
  return Stack(
    children: const [
      Center(
        child: Image(
          image: AssetImage('images/title.png'),
        ),
      ),
    ],
  );
}
const PVSpace10 = SizedBox(width: 0.0, height: 10.0);
const PVSpace20 = SizedBox(width: 0.0, height: 20.0);
const PVSpace30 = SizedBox(width: 0.0, height: 30.0);
const PHSpace10 = SizedBox(width: 10.0, height: 0.0);
Widget buildTextForm(
    BuildContext context,
    double height, {
      TextEditingController? buttonController,
      double? width,
      String? title,
      double?fontSize = 16.0,
      Color?color = Colors.black,
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title!,
        style:const TextStyle(fontFamily: 'Jannah',fontSize: 20),
      ),
      PVSpace10,
      Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: pGray300, width: 1.0),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: buttonController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget textField({
  required TextEditingController controller,
  required TextInputType keyboard,
  required var valid,
  String? label,
  IconData? prefix,
  //IconData? suffix,
  bool show = true,
  var tap,
  var onchange,
  var onSubmit,
  var suffix,
  var suffixPress,
  var labelStyle,
}) =>
    TextFormField(
      validator: valid,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(icon: Icon(suffix), onPressed: suffixPress)
            : null,
      ),
      keyboardType: keyboard,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      obscureText: show,
      onTap: tap,
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
);
Widget defButton({
  double width = double.infinity,
  double heigth = 40.0,
  var background = defaultColor,
  bool isUpper = true,
  var color = Colors.white,
  required var function,
  required String text,
}) =>
    Container(
      height: heigth,
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
Widget textButton({
  required String text,
  required var function,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase()),
    );
void showToast(String message, ToastStates state) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates {
  SUCCESS,
  ERROR,
  WARNING,
}

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}
