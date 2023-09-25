import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart';
import 'dart:convert';

class ApiService {
  final Dio _dio = Dio();
  String ipAddress = "https://reqres.in/api/";

  String buildUrl(String path) => '$ipAddress$path';

  Future<dynamic> postData({
    List<XFile>? photos,
    String? comments,
    DateTime? date,
    String? area,
    String? category,
    String? event,
    List<String>? tags,
  }) async {
    // Encode photos
    List<String> photoBase64List = [];
    if (photos != null) {
      for (var photo in photos) {
        final bytes = await photo.readAsBytes();
        final image = decodeImage(Uint8List.fromList(bytes));
        if (image != null) {
          final base64String = base64Encode(Uint8List.fromList(bytes));
          photoBase64List.add(base64String);
        }
      }
    }

    // Turn to JSON payload
    final Map<String, dynamic> payload = {
      'photos': photoBase64List,
      'comments': comments,
      'date': date?.toIso8601String(),
      'area': area,
      'category': category,
      'event': event,
      'tags': tags,
    };

    final jsonPayload = jsonEncode(payload);
    return _dio.post(
      buildUrl('users'),
      data: jsonPayload,
      options: options,
    );
  }
}

Options options = Options(
  followRedirects: false,
  validateStatus: (status) {
    return status! < 500;
  },
);
