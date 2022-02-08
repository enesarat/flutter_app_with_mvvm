import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name:"status")
  int? status;
  @JsonKey(name:"message")
  int? message;
}

@JsonSerializable()
class UserResponse{
  @JsonKey(name:"id")
  String? id;
  @JsonKey(name:"name")
  String? name;
  @JsonKey(name:"numOfNotifications")
  int? numOfNotifications;

  UserResponse(this.id,this.name,this.numOfNotifications);

  // FROM JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  // TO JSON
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class ContactResponse{
  @JsonKey(name:"phone")
  String? phone;
  @JsonKey(name:"link")
  String? link;
  @JsonKey(name:"email")
  String? email;

  ContactResponse(this.phone,this.link,this.email);

  // FROM JSON
  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);

  // TO JSON
  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name:"user")
  UserResponse? user;
  @JsonKey(name:"contacts")
  ContactResponse? contacts;

  AuthenticationResponse(this.user,this.contacts);

  // FROM JSON
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
    _$AuthenticationResponseFromJson(json);

  // TO JSON
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}