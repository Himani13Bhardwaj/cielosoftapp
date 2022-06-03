import 'package:bookatease/Modules/ReaderBookmark/reader_bookmark_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReaderBookmarkController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ReaderBookmarkRepository repository;

  ReaderBookmarkController(this.repository);

  TabController? tabController;

  final List<Tab> tabsList = <Tab>[
    const Tab(text: 'Bookmarks'),
    const Tab(text: 'Your Books'),
  ];

  List<Tab> get myTabs => tabsList;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: tabsList.length);
    super.onInit();
  }
}
