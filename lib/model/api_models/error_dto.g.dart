// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDto _$ErrorDtoFromJson(Map<String, dynamic> json) => ErrorDto(
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      password: (json['password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      deviceType: (json['device_type'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      deviceId: (json['device_id'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      token:
          (json['token'] as List<dynamic>?)?.map((e) => e as String).toList(),
      version:
          (json['version'] as List<dynamic>?)?.map((e) => e as String).toList(),
      user: (json['user'] as List<dynamic>?)?.map((e) => e as String).toList(),
      oldPassword: (json['old_password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      newPassword: (json['new_password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      confirmPassword: (json['confirm_password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      googleId: (json['google_provider_id'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
      username: (json['username'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      code: (json['code'] as List<dynamic>?)?.map((e) => e as String).toList(),
      error: json['error'] as String?,
      couponCode: (json['coupon_code'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      courseId: (json['course_id'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ErrorDtoToJson(ErrorDto instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'device_type': instance.deviceType,
      'device_id': instance.deviceId,
      'token': instance.token,
      'version': instance.version,
      'user': instance.user,
      'old_password': instance.oldPassword,
      'new_password': instance.newPassword,
      'confirm_password': instance.confirmPassword,
      'google_provider_id': instance.googleId,
      'name': instance.name,
      'username': instance.username,
      'code': instance.code,
      'coupon_code': instance.couponCode,
      'course_id': instance.courseId,
      'error': instance.error,
    };
