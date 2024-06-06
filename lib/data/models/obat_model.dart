class ObatModel {
  final String namaObat;
  final String kuantitas;
  final List penggunaan;
  final String catatan;

  ObatModel({
    required this.namaObat,
    required this.kuantitas,
    required this.penggunaan,
    required this.catatan,
  });

  factory ObatModel.fromJson(Map<String, dynamic> json) {
    return ObatModel(
      namaObat: json['nama_obat'],
      kuantitas: json['kuantitas'],
      penggunaan: json['penggunaan'],
      catatan: json['catatan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama_obat': namaObat,
      'kuantitas': kuantitas,
      'penggunaan': penggunaan,
      'catatan': catatan,
    };
  }
}
