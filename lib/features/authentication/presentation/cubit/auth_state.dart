part of 'auth_cubit.dart';


@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

 class AuthLoading extends AuthState {}
 class AuthSuccess extends AuthState {

  

 }
 class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
 }

 class UpLuodImage extends AuthState{
}

 class SignUpLouding extends AuthState{}
 class SignUpSuccess extends AuthState{
final Signupmodel signupmodel;

  SignUpSuccess({required this.signupmodel});
 }
 class SignUpError extends AuthState{
     final String message;
  SignUpError(this.message);

 }


class GetUserLouding extends AuthState{}
class GetUserSuccess extends AuthState{
  final Usermodel userdata;

  GetUserSuccess({required this.userdata});
}
class GetUserError extends AuthState{
  final String message;

  GetUserError( this.message);

}


class UpdateUserLouding extends AuthState{}
class  UpdateUserSuccess extends AuthState{
  
}
class  UpdateUserError extends AuthState{
  final String message;

   UpdateUserError( this.message);

}

