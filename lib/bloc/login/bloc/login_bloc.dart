import 'dart:convert';
import 'login_event.dart';
import 'login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider_dzikir/model/model_login.dart';
import 'package:provider_dzikir/utils/util_device.dart';
import 'package:provider_dzikir/utils/util_version.dart';
import 'package:provider_dzikir/utils/util_userPreference.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(InitialState()) {
    _loadUserData(); // Cek apakah ada data pengguna yang disimpan sebelumnya saat AuthenticationBloc dibuat
  }

  String _token = ''; // Token yang disimpan
  String _name = ''; // Nama pengguna (contoh)

  // Metode untuk memuat data pengguna dari Shared Preferences
  Future<void> _loadUserData() async {
    _token = await UserPreferences.getToken() ?? '';
    _name = await UserPreferences.getName() ?? '';
  }

  // Metode untuk menyimpan data pengguna ke Shared Preferences
  Future<void> _saveUserData(String token, String name) async {
    await UserPreferences.saveToken(token);
    await UserPreferences.saveName(name);
  }

  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is LoginEvent) {
      yield LoadingState();

      

      try {
        final deviceId = await getDeviceId();
        final appVersion = Version.getAppVersion();

        final response = await http.post(
          'http://192.168.14.213:8001/api/v1/auth/login' as Uri,
          headers: {
            'Accept': 'application/json',
            'User-Agent': 'neoPresensiAndroid',
            'Version': appVersion,
            'X-Device-Id': deviceId,
          },
          body: {
            'username': event.username,
            'password': event.password,
          },
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonResponse = json.decode(response.body);
          final loginResponse = loginModel.fromJson(jsonResponse);

          // Jika respons dari API sesuai, simpan data pengguna dan kirim AuthenticatedState dengan status dan token
          if (loginResponse.status) {
            _token = loginResponse.token;
            _name = jsonResponse['data']['name']; // Sesuaikan dengan struktur data dari API

            await _saveUserData(_token, _name);

            yield AuthenticatedState(status: true, token: _token);
          } else {
            yield ErrorState(errorMessage: loginResponse.message);
          }
        } else {
          yield ErrorState(errorMessage: 'Failed to connect to the server');
        }
      } catch (e) {
        yield ErrorState(errorMessage: 'An error occurred');
      }
    }
  }
}
