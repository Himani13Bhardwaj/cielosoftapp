import 'package:bookatease/Modules/WriterDashboard/writer_dashboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriterDashboardController extends GetxController {
  final WriterDashboardRepository repository;

  WriterDashboardController(this.repository);

  final _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
}
