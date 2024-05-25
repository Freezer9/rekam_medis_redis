class PasienModel {
  final String id;
  final String nrpOrNip;
  final String email;
  final String nama;
  final String prodiOrDepartemen;
  final String ttl;
  final String tahun;
  final String createdAt;

  PasienModel({
    required this.id,
    required this.nrpOrNip,
    required this.email,
    required this.nama,
    required this.prodiOrDepartemen,
    required this.ttl,
    required this.tahun,
    required this.createdAt,
  });

  factory PasienModel.fromMahasiswaJson(Map<String, dynamic> json) {
    return PasienModel(
      id: json['id'],
      nama: json['nama'],
      prodiOrDepartemen: json['prodi'],
      ttl: json['ttl'],
      email: json['email'],
      nrpOrNip: json['nrp'],
      tahun: json['tahun'].toString(),
      createdAt: json['createdAt'].toString(),
    );
  }

  factory PasienModel.fromDosenJson(Map<String, dynamic> json) {
    return PasienModel(
      id: json['id'],
      nrpOrNip: json['nip'],
      email: json['email'],
      nama: json['nama'],
      prodiOrDepartemen: json['departemen'],
      ttl: json['ttl'],
      tahun: json['tahun'].toString(),
      createdAt: json['createdAt'].toString(),
    );
  }

  Map<String, dynamic> toMahasiswaJson() {
    return {
      'id': id,
      'nrp': nrpOrNip,
      'email': email,
      'nama': nama,
      'prodi': prodiOrDepartemen,
      'ttl': ttl,
      'tahun': tahun,
      'createdAt': createdAt,
    };
  }

  Map<String, dynamic> toDosenJson() {
    return {
      'id': id,
      'nip': nrpOrNip,
      'email': email,
      'nama': nama,
      'departemen': prodiOrDepartemen,
      'ttl': ttl,
      'tahun': tahun,
      'createdAt': createdAt,
    };
  }
}
