class PasienEntity {
  final String id;
  final String nrpOrNip;
  final String email;
  final String nama;
  final String prodiOrDepartemen;
  final String ttl;
  final String tahun;
  final String createdAt;

  PasienEntity({
    required this.id,
    required this.nrpOrNip,
    required this.email,
    required this.nama,
    required this.prodiOrDepartemen,
    required this.ttl,
    required this.tahun,
    required this.createdAt,
  });
}
