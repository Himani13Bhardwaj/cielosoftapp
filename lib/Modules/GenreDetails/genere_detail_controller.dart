import 'package:bookatease/Modules/AuthorDetails/author_detail_repository.dart';
import 'package:bookatease/Modules/GenreDetails/genere_detail_repository.dart';
import 'package:get/get.dart';

class GenreDetailsController extends GetxController{
  final GenreDetailsRepository repository;

  GenreDetailsController(this.repository);
}