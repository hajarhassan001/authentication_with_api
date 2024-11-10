import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastering_api/core/api/dioconsumer.dart';
import 'package:mastering_api/core/database/cachehelper.dart';
import 'package:mastering_api/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:mastering_api/features/authentication/presentation/views/signIn.dart';
import 'package:mastering_api/features/authentication/presentation/views/signUp.dart';
import 'package:mastering_api/features/home/presentation/views/home.dart';
import 'package:mastering_api/features/home/presentation/views/update.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.cacheInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(Dioconsumer(dio: Dio())),
      child: MaterialApp(
        routes: {
          SignIn.routeName: (context) => const SignIn(),
          SignUp.routeName: (context) => const SignUp(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          UpdateData.routeName: (context) =>  UpdateData(),
        },
        initialRoute: SignIn.routeName,
      ),
    );
  }
}
