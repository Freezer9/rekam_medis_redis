class Keluhan {
  final int id;
  final String name;

  Keluhan(this.id, this.name);

  Keluhan.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  static where(Function(dynamic c) param0) {}
}

  final List<Keluhan> keluhan = [
    Keluhan(1, "Panas"),
    Keluhan(2, "Panas banget"),
    Keluhan(3, "Donald Glover"),
    Keluhan(4, "Gillian Jacobs"),
    Keluhan(5, "Alison Brie"),
    Keluhan(6, "Chevy Chase"),
    Keluhan(7, "Jim Rash"),
    Keluhan(8, "Yvette Nicole Brown"),
    Keluhan(9, "Jeff Winger"),
    Keluhan(10, "Abed Nadir"),
    Keluhan(11, "Troy Barnes"),
    Keluhan(12, "Britta Perry"),
    Keluhan(13, "Annie Edison"),
  ];
