import 'dart:math';

import 'package:bookatease/Modules/AddBook/add_book_repository.dart';
import 'package:bookatease/Modules/AddBook/model/add_book_model.dart';
import 'package:bookatease/Modules/AddBook/widgets/add_chapter_dialog.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Login/login_controller.dart';

class AddBookController extends GetxController {
  final AddBookRepository repository;

  AddBookController(this.repository);

  ///
  /// Add book screen textController
  ///
  final _bookNameTextEditingController = TextEditingController();
  final _bookShortDescTextEditingController = TextEditingController();
  final _bookCoverUrlTextEditingController = TextEditingController();
  final _langTextEditingController = TextEditingController();
  final _genreTextEditingController = TextEditingController();
  final _bookIntroductionTextEditingController = TextEditingController();
  final _authorIntroductionTextEditingController = TextEditingController();
  final _copyrightTextEditingController = TextEditingController();
  final _acknowledgementTextEditingController = TextEditingController();
  final _policyAgreementTextEditingController = TextEditingController();
  final _autherNameTextEditingController = TextEditingController();

  final _chapterNameTextEditingController = TextEditingController();
  final _chapterNumberTextEditingController = TextEditingController();
  final _chapterURLTextEditingController = TextEditingController();

  final selectedFilePath = ''.obs;
  final selectedFileName = ''.obs;
  var addedChapterList = <AddBookModel>[].obs;

  TextEditingController get bookNameTextEditingController =>
      _bookNameTextEditingController;

  TextEditingController get autherNameTextEditingController =>
      _autherNameTextEditingController;

  TextEditingController get bookShortDescTextEditingController =>
      _bookShortDescTextEditingController;

  TextEditingController get bookCoverUrlTextEditingController =>
      _bookCoverUrlTextEditingController;

  TextEditingController get langTextEditingController =>
      _langTextEditingController;

  TextEditingController get genreTextEditingController =>
      _genreTextEditingController;

  TextEditingController get bookIntroductionTextEditingController =>
      _bookIntroductionTextEditingController;

  TextEditingController get authorIntroductionTextEditingController =>
      _authorIntroductionTextEditingController;

  TextEditingController get copyrightTextEditingController =>
      _copyrightTextEditingController;

  TextEditingController get acknowledgementTextEditingController =>
      _acknowledgementTextEditingController;

  TextEditingController get policyAgreementTextEditingController =>
      _policyAgreementTextEditingController;

  TextEditingController get chapterNameTextEditingController =>
      _chapterNameTextEditingController;

  TextEditingController get chapterNumberTextEditingController =>
      _chapterNumberTextEditingController;

  TextEditingController get chapterURLTextEditingController =>
      _chapterURLTextEditingController;

  final LoginController _loginController = Get.find<LoginController>();

  LoginController get loginController => _loginController;

  @override
  onInit() {
    super.onInit();
    for (int i = 1; i <= Random().nextInt(10); i++) {
      addedChapterList.add(
        AddBookModel(
          "Chapter",
          "$i",
          "",
          "",
          "",
        ),
      );
    }
  }

  ///
  /// file picker
  ///
  openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      selectedFilePath.value = result.files.single.path!;
      selectedFileName.value = result.files.single.name;
    }
  }

  addBook() {
    Get.defaultDialog(
      content: AddChapterDialog(),
      title: 'Add Chapter',
      titleStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontSize: 18.0,
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold),
      ),
      confirm: CustomWidget.customButton(
          callBack: () {
            addedChapterList.add(AddBookModel(
              chapterNameTextEditingController.text,
              chapterNumberTextEditingController.text,
              chapterURLTextEditingController.text,
              selectedFileName.value,
              selectedFilePath.value,
            ));
            chapterNameTextEditingController.clear();

            chapterNumberTextEditingController.clear();
            chapterURLTextEditingController.clear();

            selectedFileName.value = '';
            selectedFilePath.value = '';
            Get.back();
          },
          height: 4.0.h,
          width: 30.0.w,
          fontWeight: FontWeight.normal,
          color: AppColor.primaryColor,
          textColor: AppColor.whiteColor,
          btnText: "Save"),
      cancel: CustomWidget.customButton(
          callBack: () {
            Get.back();
          },
          height: 4.0.h,
          width: 30.0.w,
          fontWeight: FontWeight.normal,
          color: AppColor.whiteColor,
          textColor: AppColor.primaryColor,
          btnText: "Cancel"),
    );
  }
}
