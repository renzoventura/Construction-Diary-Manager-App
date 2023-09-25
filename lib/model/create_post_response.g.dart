// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostResponse _$CreatePostResponseFromJson(Map<String, dynamic> json) =>
    CreatePostResponse(
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      comments: json['comments'] as String?,
      date: json['date'] as String?,
      area: json['area'] as String?,
      category: json['category'] as String?,
      event: json['event'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CreatePostResponseToJson(CreatePostResponse instance) =>
    <String, dynamic>{
      'photos': instance.photos,
      'comments': instance.comments,
      'date': instance.date,
      'area': instance.area,
      'category': instance.category,
      'event': instance.event,
      'tags': instance.tags,
      'id': instance.id,
      'createdAt': instance.createdAt,
    };
