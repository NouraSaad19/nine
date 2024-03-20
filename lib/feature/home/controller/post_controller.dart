import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/post_model.dart';
import '../service/post_service.dart';

class PostController extends GetxController {
  final TextEditingController postTextEditingController =
      TextEditingController();
  final PostService postService = PostService();

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
    posts = await postService.getPosts();
    update();
  }

  Future<void> addPost(PostModel post, {required File? pickedFile}) async {
    try {
      if (pickedFile != null) {
        isLoading = true;
        update();

        String? imageUrl = await postService.uploadImagePost(
          pickedFile: pickedFile,
          postId: post.uid,
        );
        print("pickedFile $pickedFile");

        if (imageUrl != null) {
          // post.imageUrl = imageUrl;
          print(imageUrl);
          print(post.imageUrl);
        } else {
          print(" null ");
        }
      }

      await postService.addPost(
        post: post,
        pickedFile: pickedFile!,
        onDone: () {
          print(" hello from controller add post $post ");
          print(" hello from controller add post ");
          fetchData();
        },
        onError: (e) {
          print(" hello from controller error ");
          isLoading = false;
          update();
        },
      );
    } catch (e) {
      print(" hello from controller catch $e");
      isLoading = false;
      update();
    }
  }

  void clearController() {
    postTextEditingController.clear();
  }
}
