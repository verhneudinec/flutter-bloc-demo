import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/user_bloc.dart';
import 'package:flutter_bloc_demo/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserEmptyState) {
            return Text("empty");
          }
          if (state is UserLoadingState) {
            return CircularProgressIndicator();
          }
          if (state is UserLoadedState) {
            return ListView.builder(
              itemCount: state.loadedUser.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    leading: Text(
                      "ID: ${state.loadedUser[index].id}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Column(
                      children: [
                        Text(
                          "${state.loadedUser[index].name}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "Email: ${state.loadedUser[index].email}",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              "Phone: ${state.loadedUser[index].phone}",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }

          if (state is UserErrorState) {
            return Text("Users loading error");
          }

          return Container();
        },
      ),
    );
  }
}
