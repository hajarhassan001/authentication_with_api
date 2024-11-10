import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mastering_api/core/api/apiconsumer.dart';
import 'package:mastering_api/core/api/endpoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastering_api/core/database/cachehelper.dart';
import 'package:mastering_api/core/errors/exceptions.dart';
import 'package:mastering_api/core/functions/uploudimagetoapi.dart';
import 'package:mastering_api/core/models/editusermodel.dart';

import 'package:mastering_api/core/models/signinmodel.dart';
import 'package:mastering_api/core/models/signupmodel.dart';

import '../../../../core/models/usermodel.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.api) : super(AuthInitial());
  final Apiconsumer api;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  SignInModel? user;
  UserEditModel? userUpdate;
  XFile? profileImage;

  TextEditingController emailup = TextEditingController();
  TextEditingController passup = TextEditingController();
  TextEditingController cpassup = TextEditingController();
  TextEditingController nameup = TextEditingController();
  TextEditingController phoneup = TextEditingController();

  TextEditingController nameUpdate = TextEditingController();
  TextEditingController phoneUpdate = TextEditingController();

  upLuodImage(XFile img) async {
    profileImage = img;
    emit(UpLuodImage());
  }

  // signIn() async {
  //   try {
  //     emit(AuthLoading());
  //     final response = await api.post(
  //         'https://food-api-omega.vercel.app/api/v1/user/signin',
  //         data: {"email": email.text, "password": pass.text});
  //     emit(AuthSuccess());
  //   } catch (e) {
  //     emit(AuthError(message: e.toString()));
  //     throw Exception(e);
  //   }
  // }

  signIn() async {
    try {
      emit(AuthLoading());
      final response = await api.post(EndPoints.signIn,
          data: {ApiKey.email: email.text, ApiKey.password: pass.text});
      user = SignInModel.fromJson(response);
      final decodeToken = JwtDecoder.decode(user!.token);
      CacheHelper.setDate(key: ApiKey.token, value: user!.token);
      CacheHelper.setDate(key: ApiKey.id, value: decodeToken[ApiKey.id]);
      emit(AuthSuccess());
    } on ServerException catch (e) {
      emit(AuthError(message: e.errorModel.messege));
    }
  }

  signUp() async {
    if (profileImage == null) {
      emit(SignUpError('Please select a profile image'));
      return;
    }
    try {
      emit(SignUpLouding());
      final response =
          await api.post(EndPoints.signUP, isFormData: true, data: {
        ApiKey.name: nameup.text,
        ApiKey.phone: phoneup.text,
        ApiKey.email: emailup.text,
        ApiKey.password: passup.text,
        ApiKey.confirmPassword: cpassup.text,
        ApiKey.location: '''
{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}

''',
        ApiKey.profilePic: UpLuodImageTOApi(profileImage!)
      });
      emit(SignUpSuccess(signupmodel: Signupmodel.fromJson(response)));
    } on ServerException catch (e) {
      emit(SignUpError(e.errorModel.messege));
    }
  }

  getUserDate() async {
    //  if (profileImage == null) {
    //   emit(GetUserError('Please select a profile image'));
    //   return;
    // }
    try {
      emit(GetUserLouding());
      final response = await api
          .get(EndPoints.getUserEndPoint(CacheHelper.getData(key: ApiKey.id)));
      emit(GetUserSuccess(userdata: Usermodel.fromJson(response)));
    } on ServerException catch (e) {
      emit(GetUserError(e.errorModel.messege));
    }
  }

  updateUserDate() async {
  //  if (profileImage == null) {
  //     emit(UpdateUserError('Please select a profile image'));
  //     return;
  //   }
    try {
      emit(UpdateUserLouding());
      final response = await api.patch(
          EndPoints.updateuser,
          isFormData: true,
          
          data: {
            ApiKey.name: nameUpdate.text,
            ApiKey.phone: phoneUpdate.text,
            ApiKey.location: '''
{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}

''',
       // ApiKey.profilePic: UpLuodImageTOApi(profileImage!)
       
            
          });
        userUpdate     = UserEditModel.fromJson(response);
        emit(UpdateUserSuccess());
       {
      }
    } on ServerException catch (e) {
      emit(UpdateUserError(e.errorModel.messege));
    }
  }
}
