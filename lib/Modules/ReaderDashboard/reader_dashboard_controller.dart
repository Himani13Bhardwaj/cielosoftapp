import 'package:bookatease/Modules/Login/login_controller.dart';
import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_repository.dart';
import 'package:bookatease/Utils/Widgets/author_widget.dart';
import 'package:bookatease/Utils/Widgets/book_widget.dart';
import 'package:bookatease/Utils/Widgets/genere_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReaderDashboardController extends GetxController {
  final ReaderDashboardRepository repository;

  ReaderDashboardController(this.repository);

  final Rx<CATEGORY> _selectedCategory = CATEGORY.LATEST.obs;

  CATEGORY get selectedCategory => _selectedCategory.value;

  final _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  final LoginController _loginController = Get.find<LoginController>();
  LoginController get loginController => _loginController;

  final _bookMark = false.obs;
  bool get bookMark => _bookMark.value;

  List<String> authorNameList = [
    "Jane Austen",
    "Sir Malory Thomas",
    "Tamara Leigh",
    "Laura Iding",
    "Emily Bronte",
    "Charlotte Bronte"
  ];

  List<String> genreList = [
    "Action",
    "Comedy",
    "Adventure",
    "Crime",
    "Drama",
    "Fantasy",
    "Historical Fiction"
  ];

  changeCategory(CATEGORY category) {
    _selectedCategory.value = category;
  }

  toggleBookMark() {
    _bookMark.value = !_bookMark.value;
  }

  getCategory(String catName) {
    switch (catName) {
      case "New":
        return CATEGORY.LATEST;
      case "Author":
        return CATEGORY.AUTHOR;
      case "Genre":
        return CATEGORY.GENRE;
    }
  }

  getCategoryName(CATEGORY category) {
    switch (category) {
      case CATEGORY.LATEST:
        return "New";
      case CATEGORY.AUTHOR:
        return "Author";
      case CATEGORY.GENRE:
        return "Genre";
    }
  }

  Widget getWidget() {
    switch (_selectedCategory.value) {
      case CATEGORY.LATEST:
        return const BookWidget();
      case CATEGORY.AUTHOR:
        return const AuthorWidget();
      case CATEGORY.GENRE:
        return const GenreWidget();
    }
  }
}

enum CATEGORY { LATEST, AUTHOR, GENRE }
