class ModelLocation {
  bool? status;
  List<DataISI>? data;

  ModelLocation({this.status, this.data});

  factory ModelLocation.fromJson(Map<String, dynamic> json) {
    return ModelLocation(
      status: json['status'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataISI.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'status': this.status,
    };
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataISI {
  String? label;
  DetailAA? detail;

  DataISI({this.label, this.detail});

  factory DataISI.fromJson(Map<String, dynamic> json) {
    return DataISI(
      label: json['label'],
      detail: json['detail'] != null
          ? DetailAA.fromJson(json['detail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'label': this.label,
    };
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    return data;
  }
}

class DetailAA {
  double? lat;
  double? long;
  int? radius;
  String? idlokasi;

  DetailAA({this.lat, this.long, this.radius, this.idlokasi});

  factory DetailAA.fromJson(Map<String, dynamic> json) {
    return DetailAA(
      lat: json['lat'],
      long: json['long'],
      radius: json['radius'],
      idlokasi: json['idlokasi'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'lat': this.lat,
      'long': this.long,
      'radius': this.radius,
      'idlokasi': this.idlokasi,
    };
    return data;
  }
}
