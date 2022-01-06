import 'package:json_annotation/json_annotation.dart';

part 'error_dto.g.dart';

@JsonSerializable()
class ErrorDto {
  ErrorDto({
    this.email,
    this.password,
    this.deviceType,
    this.deviceId,
    this.token,
    this.version,
    this.user,
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
    this.googleId,
    this.name,
    this.username,
    this.code,
    this.error,
    this.couponCode,
    this.courseId,
  });

  List<String>? email;
  List<String>? password;

  @JsonKey(name: 'device_type')
  List<String>? deviceType;

  @JsonKey(name: 'device_id')
  List<String>? deviceId;

  List<String>? token;

  List<String>? version;

  List<String>? user;

  @JsonKey(name: 'old_password')
  List<String>? oldPassword;

  @JsonKey(name: 'new_password')
  List<String>? newPassword;

  @JsonKey(name: 'confirm_password')
  List<String>? confirmPassword;

  @JsonKey(name: 'google_provider_id')
  List<String>? googleId;

  List<String>? name;

  List<String>? username;

  List<String>? code;

  @JsonKey(name: 'coupon_code')
  List<String>? couponCode;

  @JsonKey(name: 'course_id')
  List<String>? courseId;

  String? error;

  factory ErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDtoToJson(this);
}
