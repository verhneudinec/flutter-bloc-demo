import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/cubit/user_cubit.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    final UserCubit userCubit =
        BlocProvider.of<UserCubit>(context); // TODO context.bloc

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            userCubit.fetchUsers();
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
            userCubit.clearUsers();
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
