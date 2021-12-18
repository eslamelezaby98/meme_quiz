class QuizModel {
  final String quizImage;
  final String quizQuestion1;
  final String quizQuestion2;
  final String quizQuestion3;
  final String quizQuestion4;
  final String quizAnswer;

  QuizModel(
    this.quizImage,
    this.quizQuestion1,
    this.quizQuestion2,
    this.quizQuestion3,
    this.quizQuestion4,
    this.quizAnswer,
  );

  // factory QuizModel.fromJson() {}
}
