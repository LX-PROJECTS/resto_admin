import 'package:resto_admin/features/authentication/data/data_sourse/firebase_auth_datasourse.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/firebase_auth_datasourse_impl.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repositery_impl.g.dart';

class AuthRepositeryImpl implements AuthRepositery {
  final FirebaseAuthDataSourse dataSourse;

  AuthRepositeryImpl({required this.dataSourse});
  @override
  Future<void> loginAuth(String email, String password) async {
    await dataSourse.firebaseAuth(email, password);
  }

  @override
  Future<void> logout() async {
    await dataSourse.logout();
  }
}

@riverpod
AuthRepositery authRepositery(AuthRepositeryRef ref) {
  return AuthRepositeryImpl(
      dataSourse: ref.watch(firebaseAuthDataSourseProvider));
}
