import 'package:flutter/material.dart';
import 'package:forms_pocs/widgets/controls/custom_form_field.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormField(
            hintText: "Email",
            validator: (val) {
              if (val?.isEmpty ?? false) {
                return "Enter valid email";
              }

              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                debugPrint(_formKey.toString());
                debugPrint(_formKey.currentState.toString());
              }
            },
            child: const Text("Submit"),
          )
        ],
      ),
    );
  }
}
