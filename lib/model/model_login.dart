import 'dart:convert';

ModelLogin modelLoginFromJson(String str) => ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
    final bool status;
    final String message;
    final String token;
    final Data data;

    ModelLogin({
        required this.status,
        required this.message,
        required this.token,
        required this.data,
    });

    factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "data": data.toJson(),
    };
}

class Data {
    final String username;
    final String nama;

    Data({
        required this.username,
        required this.nama,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "nama": nama,
    };
}
