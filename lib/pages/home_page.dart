import 'package:flutter/material.dart';
import 'package:forms_pocs/widgets/forms/login_form/login_form.dart';
import 'package:forms_pocs/widgets/forms/login_form/login_form_values.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: CustomForm(),
        child: LoginForm(
          values: const LoginFormValues(email: "PEPE"),
          onSubmit: (values) {
            debugPrint(values.toString());
          },
        ),
      ),
    );
  }
}
