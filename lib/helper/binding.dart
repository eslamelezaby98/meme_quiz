import 'package:get/get.dart';
import 'package:meme_quiz/controller/quiz_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
    // Get.lazyPut(() =>const ResultScreen());
    // Get.lazyPut(() =>const WinnerWidget());
  }
}
