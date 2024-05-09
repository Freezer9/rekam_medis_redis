enum Role {
  admin(asset: "assets/images/admin_login.png", label: "Admin"),
  pasien(asset: "assets/images/pasien_login.png", label: "Mahasiswa / Dosen "),
  dokter(asset: "assets/images/dokter_login.png", label: "Dokter");

  final String asset;
  final String label;

  const Role({
    required this.asset,
    required this.label,
  });
}

class UserModel {
  final String id;
  final String nama;
  final String tanggalLahir;

  UserModel({
    required this.id,
    required this.nama,
    required this.tanggalLahir,
  });
}
