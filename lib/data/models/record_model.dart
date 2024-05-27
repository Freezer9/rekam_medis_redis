class RecordModel {
  final String? id;
  final List<dynamic>? keluhan;
  final List<dynamic>? diagnosis;
  final List<dynamic>? riwayatPenyakit;
  final String? pasienId;
  final String? dokterId;
  final String? createdAt;

  RecordModel({
    this.id,
    this.keluhan,
    this.diagnosis,
    this.riwayatPenyakit,
    this.pasienId,
    this.dokterId,
    this.createdAt,
  });

  factory RecordModel.fromJson(Map<String, dynamic> json) {
    return RecordModel(
      id: json['id'],
      keluhan: json['keluhan'],
      diagnosis: json['diagnosis'],
      riwayatPenyakit: json['riwayat_penyakit'],
      pasienId: json['pasien_id'],
      dokterId: json['dokter_id'],
      createdAt: json['created_at'],
    );
  }
}
