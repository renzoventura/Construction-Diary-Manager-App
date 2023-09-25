import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:martinpulgarapp/constants/constant.dart';
import 'package:martinpulgarapp/di/setup_dependencies.dart';
import 'package:martinpulgarapp/screens/log_diary/provider/diary_form_model.dart';
import 'package:martinpulgarapp/service/api_service.dart';

final diaryProvider =
    StateNotifierProvider<DiaryProvider, DiaryFormModel>((ref) {
  return DiaryProvider();
});

class DiaryProvider extends StateNotifier<DiaryFormModel> {
  ApiService api = getIt<ApiService>();

  DiaryProvider()
      : super(DiaryFormModel(
          isLoading: false,
          errorMessage: "",
          photos: [],
          date: DateTime.now(),
          area: '',
          category: '',
          event: '',
          tags: [],
        ));

  Future<void> postEntry() async {
    try {
      // throw Exception();
      updateIsLoading(true);
      var response = await api.postData(
        photos: state.photos,
        comments: state.comments,
        date: state.date,
        area: state.area,
        category: state.category,
        event: state.event,
        tags: state.tags,
      );

      updateIsLoading(false);
      // CreatePostResponse responseData =
      //     CreatePostResponse.fromJson(response.data);
      resetState();
      showSuccessMessage();
    } catch (e) {
      state = state.copyWith(
        errorMessage: failedToPostEntry,
      );

      updateIsLoading(false);
      showErrorMessage();
    }
  }

  void resetState() {
    state = state.copyWith(
      photos: [],
      comments: "",
      date: DateTime.now(),
      area: "",
      category: "",
      event: "",
      tags: [],
    );
  }

  void updateIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void addPhoto(XFile photo) {
    state = state.copyWith(
      photos: [...state.photos, photo],
    );
  }

  void removePhoto(int index) {
    if (index >= 0 && index < state.photos.length) {
      List<XFile> updatedPhotos = List.from(state.photos);
      updatedPhotos.removeAt(index);
      state = state.copyWith(
        photos: updatedPhotos,
      );
    }
  }

  void updateComment(String comment) {
    state = state.copyWith(comments: comment);
  }

  void updateDate(DateTime dateTime) {
    state = state.copyWith(date: dateTime);
  }

  void updateArea(String area) {
    state = state.copyWith(area: area);
  }

  void updateCategory(String category) {
    state = state.copyWith(category: category);
  }

  void updateEvent(String event) {
    state = state.copyWith(event: event);
  }

  void addTag(String tag) {
    state = state.copyWith(
      tags: [...state.tags, tag],
    );
  }

  void removeTag(String tag) {
    List<String> updatedTags = List.from(state.tags);
    updatedTags.remove(tag);
    state = state.copyWith(
      tags: updatedTags,
    );
  }

  showSuccessMessage() {
    Fluttertoast.showToast(
      msg: "Successfully logged entry!",
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
    );
  }

  showErrorMessage() {
    Fluttertoast.showToast(
      msg: "Failed to log entry, Try again.",
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
    );
  }
}
