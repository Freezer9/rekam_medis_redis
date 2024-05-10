import 'package:rekam_medis_redis/data/enums/role.dart';

class UserModel {
  final String id;
  final Role role;

  UserModel({
    required this.id,
    required this.role,
  });
}
