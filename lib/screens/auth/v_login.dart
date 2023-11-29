import 'dart:convert';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_dzikir/utils/util_color.dart';
import 'package:provider_dzikir/utils/util_device.dart';
import 'package:provider_dzikir/model/model_login.dart';
import 'package:provider_dzikir/utils/util_version.dart';
import 'package:provider_dzikir/utils/util_userPreference.dart';
import 'package:provider_dzikir/bloc/login/bloc/login_bloc.dart';
import 'package:provider_dzikir/bloc/login/bloc/login_state.dart';
import 'package:provider_dzikir/bloc/login/bloc/login_event.dart';
import 'package:provider_dzikir/screens/dashboard/v_dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double get screenheight => MediaQuery.of(context).size.height;
  double get screenwidth => MediaQuery.of(context).size.width;
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _isObscure = false;
  bool _isLoading = false;
  final _loginBloc = LoginBloc();

  _Login(String username, String password) async {
    if (username == '') {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(
        msg: "Username Tidak Boleh Kosong!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.sp,
      );
    } else if (password == '') {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(
        msg: "Password Tidak Boleh Kosong!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.sp,
      );
    } else {
      setState(() {
        _isLoading = true;
      });
    }

    
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: _loginBloc,
        builder: (context, state) {
          if (state is LoginLoading) {
            return const CircularProgressIndicator();
          } else if (state is LoginSuccess) {
            return const DashboardKaryawan();
          } else if (state is LoginFailure) {
            Fluttertoast.showToast(msg: state.errorMessage);
          }
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Stack(
                children: [
                  CustomPaint(
                    painter: ShapesPainter(),
                    child: Container(
                      height: screenheight / 1.3,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenwidth / 5.5),
                        child: Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 25.w,
                            width: 25.w,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                        child: Center(
                          child: Text(
                            'ATTENDANCE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenheight / 30),
                        child: Center(
                          child: Text(
                            'Fill The Bellow Information to Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Center(
                          child: Container(
                            width: screenwidth / 1.27,
                            height: screenheight / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenwidth / 20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 0.5,
                                    blurRadius: 2,
                                    offset: const Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: screenheight / 30),
                                  child: Center(
                                      child: Text(
                                    'Login Karyawan',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 9, bottom: screenwidth / 15),
                                  child: Center(
                                    child: Text(
                                      "dengan akun SIMPEG",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenwidth / 15,
                                      right: screenwidth / 15,
                                      bottom: screenheight / 18),
                                  child: Center(
                                    child: TextField(
                                      style: TextStyle(fontSize: 12.sp),
                                      controller: _username,
                                      decoration: InputDecoration(
                                        labelText: 'Username',
                                        hintStyle: TextStyle(fontSize: 12.sp),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenwidth / 15,
                                      right: screenwidth / 15),
                                  child: Center(
                                    child: TextField(
                                      controller: _password,
                                      obscureText: _isObscure,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        hintStyle: TextStyle(fontSize: 12.sp),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isObscure
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenwidth / 13),
                                _isLoading == false
                                    ? ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _isLoading = true;
                                            _loginBloc.add(LoginButtonPressed(
                                                username: _username.text,
                                                password: _password.text));
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorUtils.primaryColor(),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 22.w,
                                              vertical: 1.5.h),
                                          padding: EdgeInsets.only(
                                              left: 1.w, right: 1.w),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.sp),
                                          ),
                                        ),
                                      )
                                    : ElevatedButton(
                                        onPressed: () {
                                          _isLoading = false;
                                          setState(() {});
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorUtils.primaryColor(),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 22.w,
                                              vertical: 1.5.h),
                                          padding: EdgeInsets.only(
                                              left: 1.w, right: 1.w),
                                          child: SizedBox(
                                            height: 2.5.h,
                                            width: 2.5.h,
                                            child:
                                                const CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenwidth / 15,
                                left: screenwidth / 15,
                                right: screenwidth / 15),
                            child: Text(
                              "Universitas Muhammadiyah",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenwidth / 15, right: screenwidth / 15),
                          child: Text(
                            "Purwokerto",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

const double _kCurveHeight = 35;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();
    canvas.drawPath(p, Paint()..color = ColorUtils.primaryColor());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
