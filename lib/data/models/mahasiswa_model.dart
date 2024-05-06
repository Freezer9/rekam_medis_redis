class PasienModel {
  final String nrp;
  final String nama;
  final String prodi;
  final String ttl;

  PasienModel({
    required this.nama,
    required this.nrp,
    required this.prodi,
    required this.ttl,
  });

  factory PasienModel.fromJson(Map<String, dynamic> json) {
    return PasienModel(
      nama: json['nama'],
      nrp: json['nrp_or_nim'],
      prodi: json['prodi_or_departemen'],
      ttl: json['ttl'],
    );
  }
}
