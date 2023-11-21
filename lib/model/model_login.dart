class loginModel {
  final bool status;
  final String message;
  final String token;
  final Map<String, dynamic> data;

  loginModel({required this.status, required this.message, required this.token, required this.data});

  factory loginModel.fromJson(Map<String, dynamic> json) {
    return loginModel(
      status: json['status'],
      message: json['message'],
      token: json['token'],
      data: json['data'],
    );
  }
}
