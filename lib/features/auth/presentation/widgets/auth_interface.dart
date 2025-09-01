import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';
import 'package:tudu/features/auth/data/models/auth_model.dart';
import 'package:tudu/features/home/presentation/pages/home_page/home_page.dart';

class AuthInterface extends StatefulWidget {
  const AuthInterface({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<AuthInterface> createState() => _AuthInterfaceState();
}

class _AuthInterfaceState extends State<AuthInterface> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';

  String password = '';

  String name = '';

  bool buttonReady = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 120.h),
          child: Container(
            width: 340.w,
            height: 578.h,

            decoration: BoxDecoration(color: const Color(0xFFD1FAE5), borderRadius: BorderRadius.circular(15.r)),

            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 46.h, right: 48.w, left: 47.w),
                  child: Text("Зарегистрироваться", style: AppStyles.authText.copyWith(color: Color(0xFF059669))),
                ),
                Form(
                  key: formKey,

                  onChanged: () {
                    final isValid = formKey.currentState?.validate() ?? false;
                    setState(() => buttonReady = isValid);
                  },

                  child: Column(
                    children: [
                      authTextField(
                        widget.nameController,
                        'Введите имя',
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Имя не может быть пустым';
                          } else if (value.length < 6) {
                            return 'Имя должно быть не менее 6 символов';
                          }
                          return null;
                        },
                        (value) {
                          setState(() {
                            name = widget.nameController.text;
                          });
                          return null;
                        },
                        TextInputType.name,
                      ),

                      SizedBox(height: 60.h),

                      authTextField(
                        widget.emailController,
                        'Введите почту',
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Почта не может быть пустой';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Введите корректный адрес электронной почты';
                          }
                          return null;
                        },
                        (value) {
                          setState(() {
                            email = widget.emailController.text;
                          });
                          return;
                        },
                        TextInputType.emailAddress,
                      ),

                      SizedBox(height: 19.h),

                      authTextField(
                        widget.passwordController,
                        'Введите пароль',
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Пароль не может быть пустым';
                          } else if (value.length < 6) {
                            return 'Пароль должен быть не менее 6 символов';
                          }
                          return null;
                        },
                        (value) {
                          setState(() {
                            password = widget.passwordController.text;
                          });
                          return;
                        },
                        TextInputType.visiblePassword,
                      ),

                      SizedBox(height: 24.h),
                      authTextField(
                        widget.confirmPasswordController,
                        'Подтвердите пароль',
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Подтверждение пароля не может быть пустым';
                          } else if (value != widget.passwordController.text) {
                            return 'Пароли не совпадают';
                          }
                          return null;
                        },
                        (value) {},
                        TextInputType.visiblePassword,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),

                Text(
                  formKey.currentState?.validate() == true ? '' : 'ощибка, неверна почта или пароль',
                  style: AppStyles.authText.copyWith(color: const Color(0xFFFF0000), fontSize: 15.sp),
                ),
                SizedBox(height: 15.h),
                continueButton(() async {
                  await RegisterWithEmail(
                    userData: AuthUserData(
                      username: widget.nameController.text,
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                    ),
                  ).register();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Tudu:"shadowColor: Colors.transparent, // убрать затемнение от тениshadowColor: Colors.transparent, // убрать затемнение от тени elevation: 0,"
  Widget authTextField(
    TextEditingController controller,
    String hintText,
    String? Function(String?) validator,
    void Function(String)? onChanged,
    TextInputType keyboardType,
  ) {
    return SizedBox(
      width: 315.w,
      height: 70.h,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppStyles.authText,
          hintTextDirection: TextDirection.ltr,

          contentPadding: EdgeInsets.only(top: 1, left: 5),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.none),
          disabledBorder: InputBorder.none,

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Color(0xFFFF0000), width: 1.w),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),

          helperText: '',
          counterText: '',
          errorText: null,

          filled: true,
          fillColor: const Color(0xFF1EA379).withValues(alpha: 0.5),
        ),

        keyboardType: keyboardType,

        style: AppStyles.authText,

        cursorColor: Colors.white,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,

        autofillHints: null,
        enableSuggestions: false,
        autocorrect: false,

        validator: validator,

        onChanged: onChanged,
      ),
    );
  }

  Widget continueButton(VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(315.w, 50.h),
        backgroundColor: buttonReady
            ? const Color(0x801EA379).withValues(alpha: 0.5)
            : const Color(0xFF1EA379).withValues(alpha: 0.6),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      onPressed: buttonReady
          ? () async {
              if (formKey.currentState?.validate() ?? false) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              }
            }
          : null,
      child: Text("Продолжить", style: AppStyles.authText),
    );
  }
}
