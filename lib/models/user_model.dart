class UserModel {
  final List favorite;
  final String uId;

  const UserModel({
    required this.uId,
    required this.favorite,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      favorite: json["favorite"] == null
          ? []
          : List.of(json["favorite"]).map((favorite) => favorite).toList(),
      uId: json["uId"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "uId": uId,
      "favorite": favorite,
    };
  }

//
}
