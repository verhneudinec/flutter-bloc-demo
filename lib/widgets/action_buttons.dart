import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/user_bloc.dart';
import 'package:flutter_bloc_demo/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            userBloc.add(UserLoadEvent());
          },
          child: Text("Load"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        TextButton(
          onPressed: () {
            userBloc.add(UserClearEvent());
          },
          child: Text("Clear"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
        ),
      ],
    );
  }
}
