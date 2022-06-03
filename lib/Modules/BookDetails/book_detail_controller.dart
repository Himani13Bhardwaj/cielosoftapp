import 'package:bookatease/Modules/BookDetails/book_detail_repository.dart';
import 'package:get/get.dart';

import '../Login/login_controller.dart';

class BookDetailsController extends GetxController {
  final BookDetailsRepository repository;

  BookDetailsController(this.repository);

  final LoginController _loginController = Get.find<LoginController>();
  LoginController get loginController => _loginController;
}
