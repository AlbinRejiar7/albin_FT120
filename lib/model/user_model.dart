class UserModel {
  String? message;
  String? dataFound;
  String? status;
  Data? data;

  UserModel({
    this.message,
    this.dataFound,
    this.status,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        dataFound: json["dataFound"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "dataFound": dataFound,
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? location;
  DateTime? dob;
  String? phone;
  String? avatar;

  Data({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.location,
    this.dob,
    this.phone,
    this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        location: json["location"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        phone: json["phone"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "location": location,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "phone": phone,
        "avatar": avatar,
      };
}
