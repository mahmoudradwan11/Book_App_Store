import 'package:book_app_store/layout/Home.dart';
import 'package:book_app_store/modules/login/cubit/cubit.dart';
import 'package:book_app_store/modules/login/cubit/states.dart';
import 'package:book_app_store/modules/register/register.dart';
import 'package:book_app_store/shared/components/components.dart';
import 'package:book_app_store/shared/network/local/cache_helper.dart';
import 'package:book_app_store/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              CacheHelper.saveData(
                key: 'uId',
                value: state.uid,
              ).then((value) {
                showToast('Login Successfully', ToastStates.SUCCESS);
                navigateAndFinish(context, const Home());
              });
            }
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Scaffold(
                appBar: AppBar(backgroundColor: Colors.cyan, actions: [
                  IconButton(
                      onPressed: () {
                        navigateTo(context, RegisterScreen());
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ))
                ]),
                body: Stack(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 350,
                        color: defaultColor,
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 20,
                      right: 20,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 3),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 400,
                        width: 400,
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: defaultColor,
                                        fontFamily: 'Jannah'),
                                  ),
                                  const Text(
                                    'Nice to see you again',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Jannah'),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  textField(
                                    labelStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                    show: false,
                                    controller: emailController,
                                    keyboard: TextInputType.emailAddress,
                                    valid: (value) {
                                      if (value.isEmpty) {
                                        return 'Email Must not be Empty';
                                      }
                                      return null;
                                    },
                                    label: 'Email Address',
                                    prefix: Icons.email_outlined,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  textField(
                                    labelStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                    show: cubit.passwordShow,
                                    suffix: cubit.suffixIcon,
                                    suffixPress: () {
                                      cubit.changePasswordIcon();
                                    },
                                    controller: passwordController,
                                    keyboard: TextInputType.visiblePassword,
                                    valid: (value) {
                                      if (value.isEmpty) {
                                        return 'Password is to short';
                                      }
                                      return null;
                                    },
                                    label: 'password',
                                    prefix: Icons.lock_outline,
                                  ),
                                  //const Spacer(),
                                  if (state is LoadingLogin)
                                    const LinearProgressIndicator(),
                                  const SizedBox(
                                    height: 80,
                                  ),
                                  defButton(
                                      function: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.userLogin(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      },
                                      text: 'Login')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ));
  }
}
