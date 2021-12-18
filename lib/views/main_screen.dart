import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meme_quiz/controller/quiz_controller.dart';
import 'package:meme_quiz/data/quiz_data.dart';
import 'package:meme_quiz/helper/constants_manager.dart';

class MainScreen extends GetWidget<QuizController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        leading: Container(),
        title: const Text(
          'Meme Quiz',
        ),
      ),
      body: GetX<QuizController>(
          init: QuizController(),
          builder: (controller) {
            return Center(
              child: SizedBox(
                // color: Colors.white,
                height: 950,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // question.
                    const Text(
                      'اختر الاسم الصحيح',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // animel image.
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Container(
                        height: size.height / 4,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              QuizData.quiz[controller.cureentIndex.value]
                                      [ConstantsManager.imagePath]
                                  .toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // choices
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height / 2,
                        width: size.width,
                        child: ListView(
                          children: [
                            QuestionWidget(
                              size: size,
                              onTap: () {
                                controller.onTap(
                                    QuizData.quiz[controller.cureentIndex.value]
                                            [ConstantsManager.a1]
                                        .toString(),
                                    QuizData.quiz[controller.cureentIndex.value]
                                            [ConstantsManager.correctAnswer]
                                        .toString());
                              },
                              questionTitle: QuizData
                                  .quiz[controller.cureentIndex.value]
                                      [ConstantsManager.a1]
                                  .toString(),
                            ),
                            QuestionWidget(
                              size: size,
                              onTap: () {
                                controller.onTap(
                                    QuizData.quiz[controller.cureentIndex.value]
                                            [ConstantsManager.a2]
                                        .toString(),
                                    QuizData.quiz[controller.cureentIndex.value]
                                            [ConstantsManager.correctAnswer]
                                        .toString());
                              },
                              questionTitle: QuizData
                                  .quiz[controller.cureentIndex.value]
                                      [ConstantsManager.a2]
                                  .toString(),
                            ),
                            QuestionWidget(
                              size: size,
                              onTap: () {
                                controller.onTap(
                                    QuizData.quiz[controller.cureentIndex.value]
                                            [ConstantsManager.a3]
                                        .toString(),
                                    QuizData.quiz[controller.cureentIndex.value]
                                            [ConstantsManager.correctAnswer]
                                        .toString());
                              },
                              questionTitle: QuizData
                                  .quiz[controller.cureentIndex.value]
                                      [ConstantsManager.a3]
                                  .toString(),
                            ),
                            QuestionWidget(
                              size: size,
                              onTap: () {
                                controller.onTap(
                                    QuizData.quiz[controller.cureentIndex.value]
                                            [ConstantsManager.a4]
                                        .toString(),
                                    QuizData.quiz[controller.cureentIndex.value]
                                            [ConstantsManager.correctAnswer]
                                        .toString());
                              },
                              questionTitle: QuizData
                                  .quiz[controller.cureentIndex.value]
                                      [ConstantsManager.a4]
                                  .toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.size,
    required this.onTap,
    required this.questionTitle,
  }) : super(key: key);
  final Size size;
  final Function()? onTap;
  final String questionTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height / 10,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: onTap,
          title: Center(
            child: Center(
              child: Text(
                questionTitle,
                style:const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize:  20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
