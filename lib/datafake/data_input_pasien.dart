


var list = [
    Contact(1, "Joel McHale"),
    Contact(2, "Danny Pudi"),
    Contact(3, "Donald Glover"),
    Contact(4, "Gillian Jacobs"),
    Contact(5, "Alison Brie"),
    Contact(6, "Chevy Chase"),
    Contact(7, "Jim Rush"),
    Contact(8, "Yvette Nicole Brown"),
    Contact(9, "Jeff Winger"),
    Contact(10, "Abed Nadir"),
    Contact(11, "Troy Barnes"),
    Contact(12, "Britta Perry"),
    Contact(13, "Annie Edison"),
    ];

class Contact {
    final int id;
    final String name;

    Contact(
        this.id,
        this.name,
    );

    Contact.fromJson(Map<String, dynamic> json)
        : id = json['id'],
            name = json['name'];

    Map<String, dynamic> toJson() {
            return {
            'id': id,
            'name': name,
            };
        }
}