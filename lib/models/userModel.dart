import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.greeting,
    required this.instructions,
  });

  String greeting;
  List<String> instructions;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        greeting: json["greeting"],
        instructions:
            List<String>.from((json["instructions"] as List).map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "greeting": greeting,
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
      };
}
