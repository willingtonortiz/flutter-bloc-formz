import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_pocs/widgets/forms/login_form/login_form_values.dart';
import 'package:forms_pocs/widgets/models/email.dart';
import 'package:formz/formz.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc({
    required this.initialState,
  }) : super(initialState.toState()) {
    on<EmailChanged>(_onEmailChanged);
    on<EmailUnfocused>(_onEmailUnfocused);
    on<FormSubmitted>(_onFormSubmitted);
  }

  final LoginFormValues initialState;

  void _onEmailChanged(EmailChanged event, Emitter<LoginFormState> emit) {
    final email = Email.dirty(event.email);

    emit(
      state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([email]),
      ),
    );
  }

  void _onEmailUnfocused(EmailUnfocused event, Emitter<LoginFormState> emit) {
    final email = Email.dirty(state.email.value);
    debugPrint("Perdi el foco");

    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email]),
      ),
    );
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<LoginFormState> emit,
  ) async {
    final email = Email.dirty(state.email.value);

    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email]),
      ),
    );

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
