import './quiz.dart';

class Answer {
  final String answer;

  Answer({required this.answer});

  bool isCorrect(Question question) {
    if (answer.trim().isEmpty) return false;
    return question.goodAnswer.trim() == answer.trim();
  }
}

class Submission {
  final Map<Question, String> _answers = {};
  final List<Question> questions;

  Submission({required this.questions});

  int getScore() {
    int score = 0;
    for (var question in questions) {
      final answer = _answers[question] ?? ''; // assign for empty answer
      if (Answer(answer: answer).isCorrect(question)) {
        score++;
      }
    }
    return score;
  }

  Answer? getAnswerFor(Question question) {
    final answer = _answers[question];
    return answer != null ? Answer(answer: answer) : null;
  }

  void addAnswer(Question question, String answer) {
    _answers[question] = answer.trim();
  }

  void removeAnswers() {
    _answers.clear();
  }
}
