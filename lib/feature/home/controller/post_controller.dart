import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/post_model.dart';
import '../service/post_service.dart';

class PostController extends GetxController {
  final TextEditingController postTextEditingController =
      TextEditingController();
  final PostService homeService = PostService();
  final GetStorage authStorage = GetStorage();

  List<PostModel> posts = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    posts.clear();
    posts = await homeService.getPosts();
    update();
  }

  Future<void> addPost(PostModel post, {required File? pickedFile}) async {
    try {
      await homeService.addPost(
        post: post,
        pickedFile: pickedFile!,
        onDone: () {
          fetchData();
        },
        onError: (e) {
          isLoading = false;
          update();
        },
      );
    } catch (e) {
      isLoading = false;
      update();
    }
  }

  void clearController() {
    postTextEditingController.clear();
  }
}
