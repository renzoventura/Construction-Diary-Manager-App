import 'package:json_annotation/json_annotation.dart';

part 'create_post_response.g.dart';

@JsonSerializable()
class CreatePostResponse {
  List<String>? photos;
  String? comments;
  String? date;
  String? area;
  String? category;
  String? event;
  List<String>? tags;
  String? id;
  String? createdAt;

  CreatePostResponse({
    this.photos,
    this.comments,
    this.date,
    this.area,
    this.category,
    this.event,
    this.tags,
    this.id,
    this.createdAt,
  });

  factory CreatePostResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostResponseToJson(this);
}
