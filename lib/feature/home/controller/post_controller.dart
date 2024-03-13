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
    posts = await homeService.getPosts();
    update();
  }

  Future<void> addPost(PostModel post, {required File? pickedFile}) async {
    try {
      if (pickedFile != null) {
        isLoading = true;
        update();

        String? imageUrl = await homeService.uploadImage(
          pickedFile: pickedFile,
          uid: post.uid,
        );

        if (imageUrl != null) {
          post.imageUrl = imageUrl;
        } else {
          // print('Failed to upload image from controller ${post.imageUrl}');
        }
      }

      await homeService.addPost(
        post: post,
        pickedFile: pickedFile!,
        onDone: () {
          print("Post added: ${post.uid}");
          fetchData();
        },
        onError: (e) {
          isLoading = false;
          update();
          print('Error adding post: $e');
        },
      );
    } catch (e) {
      isLoading = false;
      update();
      print('Error adding post: $e');
    }
  }

  void clearController() {
    postTextEditingController.clear();
  }
}
