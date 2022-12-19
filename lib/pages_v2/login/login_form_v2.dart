
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/authentication/firebase_repository.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/user_entity.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserListCubit(),
      child: LoginFormV2(),
    );
  }
}


class LoginFormV2 extends StatefulWidget{
  @override
  LoginFormV2State createState() {
    return LoginFormV2State();
  }

}

class LoginFormV2State extends State<LoginFormV2> {

  UserCubit get _cubit => context.read<UserCubit>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   /* return BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if (state is NotAuthenticated) {
            // todo
            // here insert login form
            return Container();
          } else if (state is UserAuthenticated) {
            // todo
            // navigare verso la pagina corretta
            return Container();
          } else if (state is UserAuthenticationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // UserErrorAuthentication
            // todo
            // restituire form con errori in evidenza
            return Container();
          }
        }); */

    // for testing purpose, insert here Login form
    return Container();
  }





}
