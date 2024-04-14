import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/presentation/bloc/user/user_event.dart';
import 'package:user_app/presentation/bloc/user/user_state.dart';
import 'package:user_app/repository/repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
	final UserRepository userRepository;

  UserBloc({required this.userRepository}): super(UserInitial()) {
    on<FetchUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userRepository.fetchUser(event.username);
        emit(UserLoaded(user));
      }catch(err) {
        emit(UserError(err.toString()));
      }

    });
  }
}
