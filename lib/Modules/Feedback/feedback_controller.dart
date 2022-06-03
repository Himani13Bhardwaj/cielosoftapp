import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feedback_repository.dart';

class FeedBackController extends GetxController {
  final FeedbackProfileRepository repository;

  FeedBackController(this.repository);

  final _nameTextEditingController = TextEditingController();
  final _messageTextEditingController = TextEditingController();

  TextEditingController get nameTextEditingController =>
      _nameTextEditingController;
  TextEditingController get messageTextEditingController =>
      _messageTextEditingController;
}
