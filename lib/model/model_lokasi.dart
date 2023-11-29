import 'dart:convert';

ModelLokasi modelLokasiFromJson(String str) => ModelLokasi.fromJson(json.decode(str));

String modelLokasiToJson(ModelLokasi data) => json.encode(data.toJson());

class ModelLokasi {
    final bool status;
    final List<Datum> data;

    ModelLokasi({
        required this.status,
        required this.data,
    });

    factory ModelLokasi.fromJson(Map<String, dynamic> json) => ModelLokasi(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final String label;
    final Detail detail;

    Datum({
        required this.label,
        required this.detail,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        label: json["label"],
        detail: Detail.fromJson(json["detail"]),
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "detail": detail.toJson(),
    };
}

class Detail {
    final double lat;
    final double long;
    final int radius;

    Detail({
        required this.lat,
        required this.long,
        required this.radius,
    });

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        radius: json["radius"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
        "radius": radius,
    };
}
