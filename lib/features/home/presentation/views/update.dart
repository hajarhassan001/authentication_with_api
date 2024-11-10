import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastering_api/core/models/usermodel.dart';
import 'package:mastering_api/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:mastering_api/features/authentication/presentation/widgets/custom_TextFrom.dart';
import 'package:mastering_api/features/authentication/presentation/widgets/secret_textForm.dart';
import 'package:mastering_api/features/home/presentation/views/home.dart';

class UpdateData extends StatelessWidget {
  UpdateData({super.key});
  static String routeName = "UpdateData";

  GlobalKey<FormState> fKeyNameUpdate = GlobalKey<FormState>();
  GlobalKey<FormState> fKeyPhoneUpdate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Update Your Data",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextfrom(
                labelText: "Name",
                controller: context.read<AuthCubit>().nameUpdate,
                fKey: fKeyNameUpdate,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfrom(
                labelText: "Phone",
                controller: context.read<AuthCubit>().phoneUpdate,
                fKey: fKeyPhoneUpdate,
              ),
              const SizedBox(
                height: 20,
              ),
              state is UpdateUserLouding
                  ? const CircularProgressIndicator()
                  : MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        if (fKeyNameUpdate.currentState!.validate() 
                      ||
                            fKeyPhoneUpdate.currentState!.validate()) {
                          context.read<AuthCubit>().updateUserDate();
                        }
                        context.read<AuthCubit>().getUserDate();
                        Navigator.pop(context, HomeScreen.routeName);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
