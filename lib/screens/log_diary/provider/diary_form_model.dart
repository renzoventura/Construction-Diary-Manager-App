import 'package:image_picker/image_picker.dart';

class DiaryFormModel {
  DiaryFormModel({
    required this.photos,
    this.isLoading = true,
    this.errorMessage = "",
    this.comments = "",
    required this.date,
    required this.area,
    required this.category,
    required this.event,
    required this.tags,
  });

  //Screen states
  late bool isLoading;
  late String errorMessage;

  //Form Details
  List<XFile> photos = [];
  late String comments;
  DateTime date = DateTime.now();
  late String area;
  late String category;
  late String event;
  List<String> tags = [];

  DiaryFormModel copyWith({
    bool? isLoading = false,
    String? errorMessage,
    List<XFile>? photos,
    String? comments,
    DateTime? date,
    String? area,
    String? category,
    String? event,
    List<String>? tags,
  }) {
    return DiaryFormModel(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      photos: photos ?? this.photos,
      comments: comments ?? this.comments,
      date: date ?? this.date,
      area: area ?? this.area,
      category: category ?? this.category,
      event: event ?? this.event,
      tags: tags ?? this.tags,
    );
  }
}
