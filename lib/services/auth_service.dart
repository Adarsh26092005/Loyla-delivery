import '../entities/user.dart';

class AuthService {
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Mock success — accepts anything for now.
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<AppUser?> fetchCurrentAppUser() async {
    return const AppUser(
      id: 'user1',
      name: 'Kumar Adarsh',
      email: 'kumaradarsh26092005@gmail.com',
      role: 'delivery_boy',
    );
  }
}
