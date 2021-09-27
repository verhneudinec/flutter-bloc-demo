import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/user_bloc.dart';
import 'package:flutter_bloc_demo/services/user_repository.dart';
import 'package:flutter_bloc_demo/widgets/action_buttons.dart';
import 'package:flutter_bloc_demo/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersRepository = UsersRepository();

    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository: usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('User list'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ActionButtons(),
            Expanded(
              child: UserList(),
            ),
          ],
        ),
      ),
    );
  }
}
