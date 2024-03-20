import 'package:flutter/material.dart';
import 'package:flutter_template/feature/home/service/comment_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/comment_model.dart';
import '../model/post_model.dart';

class CommentController extends GetxController {
  final TextEditingController commentTextEditingController =
      TextEditingController();
  final TextEditingController replyTextEditingController = TextEditingController();
  final GetStorage authStorage = GetStorage();
  final CommentService commentService = CommentService();

  List<CommentModel> comments = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchCommentsForPost(String postId) async {
    try {
      isLoading = true;
      update();
      comments = await commentService.getCommentsForPost(postId);
      update();
    } catch (e) {
      print("Error fetching comments: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> addCommentToPost({
    required PostModel post,
    required CommentModel comment,
  }) async {
    try {
      isLoading = true;
      update();

      await commentService.addCommentToPost(
          comment: comment, postId: post.postId!);
      print("Comment added successfully");

      await fetchCommentsForPost(post.postId!);

      clearController();
    } catch (error) {
      print("Error adding comment: $error");
    } finally {
      isLoading = false;
      update();
    }
  }

  void clearController() {
    commentTextEditingController.clear();
    replyTextEditingController.clear();
  }
}
