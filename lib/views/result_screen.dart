import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meme_quiz/controller/quiz_controller.dart';
import 'package:meme_quiz/helper/assets_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.put(QuizController());
    if (controller.result.value == 10) {
      return ResultWidget(
        image: AssetsManager.winner,
        result: controller.result.value.toString(),
      );
    } else {
      return ResultWidget(
        image: AssetsManager.losser,
        result: controller.result.value.toString(),
      );
    }
  }
}

class ResultWidget extends GetWidget<QuizController> {
  const ResultWidget({
    Key? key,
    required this.result,
    required this.image,
  }) : super(key: key);

  final String result;
  final String image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Result',
        ),
        leading: Container(),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 950,
                width: size.width,
                child: Column(
                  children: [
                    Text(
                      'النتيجة : 10 / $result',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Container(
                        height: size.height / 4,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            // fit: BoxFit.,
                            image: AssetImage(image),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controller.tryAgain,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(
                          size.width / 2,
                          size.height / 15,
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'جرب تانى لو حابب',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      
                    ),
                   const SizedBox(height: 40),
                    const Text(
                        'اسكرين شوت و شير انجازك',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 20,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                launch(
                  'https://twitter.com/eslamelezaby98',
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Developed by : Eslam Elezaby 🥳',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
