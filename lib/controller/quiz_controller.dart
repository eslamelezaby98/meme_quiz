import 'package:get/get.dart';
import 'package:meme_quiz/helper/route_manager.dart';

class QuizController extends GetxController {
  RxInt result = 0.obs;
  RxInt cureentIndex = 0.obs;

  onTap(String qestion, String answer) {
    // print(cureentIndex.value);
    if (cureentIndex >= 9) {
      if (qestion != answer && result == 0.obs) {
        result = 0.obs;
        Get.offAndToNamed(Routes.resultScreen);
      } else if (qestion != answer && result.value > 0) {
        result--;
        Get.offAndToNamed(Routes.resultScreen);
      } else if (qestion == answer) {
        result++;
        Get.offAndToNamed(Routes.resultScreen);
      }
      update();
    } else {
      cureentIndex++;
      if (qestion == answer) {
        result++;
        // print('result++ $result');
      } else if (qestion != answer && result.value == 0) {
        result = 0.obs;
        // print('result = 0 $result');
      } else if (qestion != answer && result.value > 0) {
        result--;
        // print('result-- $result');
      }
      update();
    }
  }

  tryAgain() {
    Get.toNamed(Routes.mainScreen);
    cureentIndex = 0.obs;
    result = 0.obs;
    update();
  }
}
