
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthErrorOccurred extends AuthState {
  final String error;

  AuthErrorOccurred({required this.error});
}

class AuthRegisterSuccess extends AuthState {}
class AuthCreateSuccess extends AuthState {}
class UserLoginSuccess extends AuthState {}
class CheckUserSuccess extends AuthState {}
class GetType extends AuthState {}
class AuthLoading extends AuthState {}
class LogOut extends AuthState {}
class CheckAdminSuccess extends AuthState {}
class PasswordStateChanged extends AuthState {}

