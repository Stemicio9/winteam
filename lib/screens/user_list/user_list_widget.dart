import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/widgets/card_candidato.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

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
  final txtList = TextEditingController();


  @override
  void initState() {
    callRestWithoutFiltered("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                onChanged: (newValue) {
                  callRestWithoutFiltered(newValue);
                },
              ),
            ),



            BlocBuilder<UserListCubit, UserListState>(
                builder: (_, state) {
                  if (state is UserListLoading) {
                    return Center(child: loadingGif());
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


  void callRestWithoutFiltered(String filtro){
    if(filtro.isEmpty){
      callRestWithout();
      return;
    }
    Filter filter = Filter();
    filter.filterOr = "email|like_insensitive|$filtro|string";
    filter.filterOr = "${filter.filterOr}&firstName|like_insensitive|$filtro|string";
    filter.filterOr = "${filter.filterOr}&lastName|like_insensitive|$filtro|string";
    _cubit.fetchUserFilteredPaged(filter);
  }

  void callRestWithout(){
    _cubit.fetchUserFilteredPaged(Filter());
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
      Expanded(
          child: Container(
            child: RefreshIndicator(
              onRefresh: (){
                callRestWithoutFiltered(txtList.text);
                return Future<bool>.value(true);
                },
            child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context,index) {
                  return Container(
                    child: CardCandidato(user: userList[index], match: true)
                  );
                }
            )
            ),
          )
      );

  }

}






