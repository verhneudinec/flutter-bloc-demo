import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/cubit/user_state.dart';
import 'package:flutter_bloc_demo/models/user.dart';
import 'package:flutter_bloc_demo/services/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UsersRepository usersRepository;

  static UserState get initialState => UserEmptyState();

  UserCubit(this.usersRepository) : super(initialState);

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());

      final List<User> _loadedUserList = await usersRepository.getAllUsers();

      emit(
        UserLoadedState(loadedUser: _loadedUserList),
      );
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}
