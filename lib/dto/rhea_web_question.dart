class RheaWebQuestion {
  RheaWebQuestion({required this.question, required this.answer});

  String? question;
  String? answer;

  factory RheaWebQuestion.fromJson(Map<String, String> json) {
    return RheaWebQuestion(question: json['question'], answer: json['answer']);
  }
}
