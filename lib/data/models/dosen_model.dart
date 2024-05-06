class DosenModel {
  final String nip;
  final String nama;
  final String departemen;
  final String ttl;
  final String userId;

  DosenModel({
    required this.nama,
    required this.nip,
    required this.departemen,
    required this.ttl,
    required this.userId,
  });

  factory DosenModel.fromJson(Map<String, dynamic> json) {
    return DosenModel(
      nama: json['nama'],
      nip: json['nrp_or_nim'],
      departemen: json['prodi_or_departemen'],
      ttl: json['ttl'],
      userId: json['user_id'],
    );
  }
}
