import 'package:rekam_medis_redis/data/models/user_model.dart';

class DokterModel extends UserModel {
  final String sip;
  final String spesialis;

  DokterModel({
    required super.id,
    required super.nama,
    required super.tanggalLahir,
    required this.sip,
    required this.spesialis,
  });
}
