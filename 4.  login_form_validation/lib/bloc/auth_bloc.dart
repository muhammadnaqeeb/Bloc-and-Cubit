import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final email = event.email;
          final password = event.password;

          // here you can perform different things like validation

          // Email validation using regex can be done
          if (password.length < 6) {
            emit(AuthFailure(
                error: "Password cannot be less then 6 characters"));
            return;
          }

          // just imagine we are talking to database
          await Future.delayed(const Duration(seconds: 2), () {
            emit(AuthSuccess(uid: '$email - $password'));
            return;
          });
        } catch (e) {
          return emit(AuthFailure(error: e.toString()));
        }
      },
    );
    on<AuthLogOutRequested>((event, emit) async {
      try {
        await Future.delayed(const Duration(seconds: 2), () {
          // as we cannot do AuthSuccess as we don't have uid and it will be il-logical
          emit(AuthInitial());
          return;
        });
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
