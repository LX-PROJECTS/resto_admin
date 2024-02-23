import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<void> updatePassword(String newPassword);
  Future<void> login(String email, String password);
  Future<void> logout();
  Future<void> setUser(UserEntity userEntity);
  Stream<UserEntity> getUser(String userId);
  Future<void>updateProfileImage(String imagePath,String uid);
}
