class PopActor {
  final int id;
  final String name;

  PopActor({required this.id, required this.name});

  factory PopActor.fromJSON(Map<String, dynamic> json) {
    return PopActor(id: json['person_id'], name: json['person_name']);
  }
}
