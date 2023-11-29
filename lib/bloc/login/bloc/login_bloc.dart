import 'dart:async';
import 'dart:convert';
import 'login_event.dart';
import 'login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider_dzikir/model/model_login.dart';
import 'package:provider_dzikir/utils/util_version.dart';
import 'package:provider_dzikir/utils/util_userPreference.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      final username = event.username;
      final password = event.password;

      if (username.isEmpty || password.isEmpty) {
        emit(Fluttertoast.showToast(msg: "Username dan Kata Sandi Kosong! \nPeriksa Kembali!", toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.CENTER, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16) as LoginState);
        return;
      } else {
        try {
          final response = await http.post(
            Uri.parse('http://192.168.14.213:8001/api/v1/auth/login'),
            headers: {
              'Accept': 'application/json',
              'User-Agent': 'neoPresensiAndroid',
              'version': Version.getAppVersion(),
            },
            body: {
              'username': event.username,
              'password': event.password,
            },
          );

          if (response.statusCode == 200) {
            final Map<String, dynamic> jsonResponse =
                json.decode(response.body);
            final loginResponse = ModelLogin.fromJson(jsonResponse);

            if (loginResponse.status) {
              await _saveUserData(
                  loginResponse.token, loginResponse.data.username);
              emit(LoginSuccess(modelLogin: loginResponse));
            } else {
              emit(LoginFailure(errorMessage: loginResponse.message));
            }
          } else {
            emit(const LoginFailure(
                errorMessage: 'Failed to connect to the server'));
          }
        } catch (e) {
          emit(const LoginFailure(errorMessage: 'An error occurred'));
        }
      }
    });
  }

  Future<void> _saveUserData(String token, String name) async {
    await UserPreferences.saveToken(token);
    await UserPreferences.saveName(name);
  }
}
