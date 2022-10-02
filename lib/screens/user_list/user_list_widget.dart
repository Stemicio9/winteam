



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/entities/user_entity.dart';

class UserListWidget extends StatelessWidget {

  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => UserListCubit(),
        child: UserListView(),
    );
  }

}


class UserListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return UserListViewState();
  }

}


class UserListViewState extends State<UserListView> {


  UserListCubit get _cubit => context.read<UserListCubit>();

  @override
  void initState() {
    callRest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Column(
          children: [
            MaterialButton(child: Text("refresh forte"),onPressed: (){callRestWithout();}),
            BlocBuilder<UserListCubit, UserListState>(
                builder: (_, state) {
                  print("SONO DENTRO IL BLOCBUILDER");
                  if (state is UserListLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserListLoaded) {
                    return userList(state.users);
                  } else if (state is UserListEmpty) {
                    // @todo insert an empty state element
                    return Container();
                  } else {
                    return const Center(child: Text('Errore di caricamento'));
                  }
                }),
          ],
        ),
    );
  }


  void callRestWithout(){
    _cubit.fetchUsers();
  }

  void callRest(){
    print("FACCIO PARTIRE IL TASK");
    Future.delayed(const Duration(seconds: 5), () {
       _cubit.fetchUsers();
       print("HO TERMINATO IL TASK");
    });
  }


  Widget userList(List<UserEntity> userList){
    return
    Container(
      height: 600,
      child: ListView.builder(
        itemCount: userList.length,
          itemBuilder: (context,index) {
            return Container(
              child: Text(userList[index].email),
            );
          }
      ),
    );

  }

}






