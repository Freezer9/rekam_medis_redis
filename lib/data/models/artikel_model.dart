class ArtikelModel {
  final int? id;
  final String image;
  final String judul;
  final String isi;
  final String createdAt;

  ArtikelModel({
    this.id,
    required this.image,
    required this.judul,
    required this.isi,
    required this.createdAt,
  });

  factory ArtikelModel.fromJson(Map<String, dynamic> json) {
    return ArtikelModel(
      id: json['id'],
      image: json['image'],
      judul: json['judul'],
      isi: json['isi'],
      createdAt: json['created_at'],
    );
  }
}
