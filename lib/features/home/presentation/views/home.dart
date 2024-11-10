
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastering_api/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:mastering_api/features/home/presentation/views/update.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = "HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    @override
  void initState() {
    context.read<AuthCubit>().getUserDate();
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 2, 23, 41),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return state is GetUserLouding
                ? const CircularProgressIndicator()
                : state is GetUserSuccess
                    ? Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: CircleAvatar(
                            //       radius: 80,
                            //       backgroundImage: FileImage(File(context
                            //           .read<AuthCubit>()
                            //           .profileImage!
                            //           .path))),
                            // ),

                            SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Text(
                                "Hi, ${state.userdata.name} Welcome In My App!",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            Column(
                              
                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [     SizedBox(
                              width: double.infinity,
                              height: 30,
                              child: Text(
                                state.userdata.coordinates[0].toString(),
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                                 SizedBox(
                              width: double.infinity,
                              height: 30,
                              child: Text(
                                state.userdata.email,
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                               SizedBox(
                              width: double.infinity,
                              height: 30,
                              child: Text(
                                state.userdata.phone,
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                            ],),



                                 MaterialButton(
                    color: Colors.blue,
                    onPressed: ()async {
                  await   Navigator.pushNamed(context, UpdateData.routeName);
                
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "Update Your Data",
                      style: TextStyle(

                        color: Colors.white,

                        fontSize: 20,



                      ),
                    ),
                  )
                       
                       
                         
                          ],


                        ),
                      )
                    : const SizedBox(
                      child: Text("no data",style: TextStyle(color: Colors.amber),),
                    );
          },


        ));
  }
}
