class Comment {
  String description = '';
  int score = 0;
  DateTime date = DateTime.now();
  String name = ""; //Cambiar por datos del usuario
  Comment(
      {required this.name,
      required this.description,
      required this.date,
      required this.score});
}
