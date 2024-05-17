import 'package:rekam_medis_redis/data/entities/pasien_entity.dart';

class PasienModel extends PasienEntity {
  PasienModel({
    required super.id,
    required super.nrpOrNip,
    required super.email,
    required super.nama,
    required super.prodiOrDepartemen,
    required super.ttl,
    required super.tahun,
    required super.createdAt,
  });

  factory PasienModel.fromMahasiswaJson(Map<String, dynamic> json) {
    return PasienModel(
      id: json['id'],
      nrpOrNip: json['nrp'],
      email: json['email'],
      nama: json['nama'],
      prodiOrDepartemen: json['prodi'],
      ttl: json['ttl'],
      tahun: json['tahun'],
      createdAt: json['createdAt'],
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
      tahun: json['tahun'],
      createdAt: json['createdAt'],
    );
  }
}
