import 'package:bookatease/Modules/AddBook/add_book_binding.dart';
import 'package:bookatease/Modules/AddBook/add_book_view.dart';
import 'package:bookatease/Modules/AddBook/edit_book_view.dart';
import 'package:bookatease/Modules/AuthorDetails/author_details_binding.dart';
import 'package:bookatease/Modules/AuthorDetails/author_details_view.dart';
import 'package:bookatease/Modules/BookDetails/book_details_binding.dart';
import 'package:bookatease/Modules/BookDetails/book_details_view.dart';
import 'package:bookatease/Modules/Feedback/feedback_binding.dart';
import 'package:bookatease/Modules/Feedback/feedback_view.dart';
import 'package:bookatease/Modules/GenreDetails/genere_details_binding.dart';
import 'package:bookatease/Modules/GenreDetails/genere_details_view.dart';
import 'package:bookatease/Modules/Home/home_binding.dart';
import 'package:bookatease/Modules/Home/home_view.dart';
import 'package:bookatease/Modules/Login/login_binding.dart';
import 'package:bookatease/Modules/Login/login_view.dart';
import 'package:bookatease/Modules/Onboarding/splash_screen.dart';
import 'package:bookatease/Modules/Onboarding/welcome_screen.dart';
import 'package:bookatease/Modules/ReadBook/read_book_view.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_binding.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_view.dart';
import 'package:bookatease/Modules/Registration/registration_binding.dart';
import 'package:bookatease/Modules/Registration/registration_view.dart';
import 'package:bookatease/Modules/WriterHome/writer_home_binding.dart';
import 'package:bookatease/Modules/WriterHome/writer_home_view.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:get/get.dart' show GetPage, Transition;

import '../Modules/BookDetails/Widgets/chapter_list_view.dart';

const Transition transition = Transition.cupertino;

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.splashScreen;

  static final routes = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
        transition: transition),
    GetPage(
        name: Routes.welcomeScreen,
        page: () => const WelcomeScreen(),
        transition: transition),
    GetPage(
        name: Routes.loginScreen,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        transition: transition),
    GetPage(
        name: Routes.homeScreen,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: transition),
    GetPage(
        name: Routes.registrationScreen,
        page: () => const RegistrationScreen(),
        binding: RegistrationBinding(),
        transition: transition),
    GetPage(
        name: Routes.bookDetailsScreen,
        page: () => const BookDetailsScreen(),
        binding: BookDetailsBinding(),
        transition: transition),
    GetPage(
        name: Routes.readBookScreen,
        page: () => const ReadBookView(),
        binding: BookDetailsBinding(),
        transition: transition),
    GetPage(
        name: Routes.writerHomeScreen,
        page: () => const WriterHomeScreen(),
        binding: WriterHomeBinding(),
        transition: transition),
    GetPage(
        name: Routes.addBookScreen,
        page: () => const AddBookView(),
        binding: AddBookBinding(),
        transition: transition),GetPage(
        name: Routes.updateBookScreen,
        page: () => const EditBookView(),
        binding: AddBookBinding(),
        transition: transition),
    GetPage(
        name: Routes.authorDetailsScreen,
        page: () => const AuthorDetailsScreen(),
        binding: AuthorDetailsBinding(),
        transition: transition),
    GetPage(
        name: Routes.genreDetailsScreen,
        page: () => const GenreDetailsScreen(),
        binding: GenreDetailsBinding(),
        transition: transition),
    GetPage(
        name: Routes.chapListScreen,
        page: () => const ChapterListScreen(),
        binding: AddBookBinding(),
        transition: transition),
    GetPage(
        name: Routes.feedBackScreen,
        binding: FeedbackBinding(),
        page: () => const FeedBackScreen(),
        transition: transition),
    GetPage(
        name: Routes.feedBackScreen,
        binding: ReaderProfileBinding(),
        page: () => const ReaderProfileScreen(),
        transition: transition),
  ];
}
