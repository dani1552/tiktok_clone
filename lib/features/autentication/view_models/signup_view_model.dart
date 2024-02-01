import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/autentication/repos/authentication_repo.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;
  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp() async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    AsyncValue.guard(
      () async => await ref.read(authRepo).signUp(
            form["email"],
            form["password"],
          ),
    );
  }
}

final signUpForm = StateProvider((ref) => {});
