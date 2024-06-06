class DokterModel {
  final String id;
  final String nama;
  final String ttl;
  final String sip;
  final String email;
  final String createdAt;

  DokterModel({
    required this.id,
    required this.nama,
    required this.ttl,
    required this.sip,
    required this.email,
    required this.createdAt,
  });

  factory DokterModel.fromJson(Map<String, dynamic> json) {
    return DokterModel(
      id: json['id'].toString(),
      nama: json['nama'],
      ttl: json['ttl'],
      sip: json['sip'],
      email: json['email'],
      createdAt: json['created_at'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'ttl': ttl,
      'sip': sip,
      'email': email,
      'created_at': createdAt,
    };
  }
}
