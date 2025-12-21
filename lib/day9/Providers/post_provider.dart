import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final Box<PostModel> _postBox = Hive.box<PostModel>('postsBox');

  List<PostModel> _posts = [];

  List<PostModel> get posts => _posts;
  void loadFromHive() {
    _posts = _postBox.values.toList();
    notifyListeners();
  }
  Future<void> fetchPosts() async {
    try {
      final data = await _apiService.fetchPosts();
      _posts = data;

      await _postBox.clear();
      await _postBox.addAll(data);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
