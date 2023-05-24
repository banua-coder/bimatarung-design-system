import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final form = FormGroup(
    {
      'password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
      'email': FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      'genders': FormControl<String?>(
        validators: [
          Validators.required,
        ],
      ),
    },
  );

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bimatarunt Text Field'),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: 35.h,
          bottom: 32.h,
          left: 20.w,
          right: 20.w,
        ),
        shrinkWrap: true,
        children: [
          ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                _Child(
                  'Password Field',
                  child: BTPasswordField(
                    formControl: form.control('password'),
                    hintText: 'Password',
                    label: 'Password',
                    onSubmitted: (_) => form.control('email').focus(),
                    textInputAction: TextInputAction.next,
                    validationMessages: {
                      ValidationMessage.required: (_) =>
                          'Password tidak boleh kosong!',
                      ValidationMessage.minLength: (control) {
                        var validated = control as Map;
                        var minLength = validated['requiredLength'];
                        return 'Password harus terdiri dari minimal $minLength karakter.';
                      },
                    },
                  ),
                ),
                _Child(
                  'Text Field',
                  child: BTTextField(
                    formControl: form.control('email'),
                    onSubmitted: (_) => form.control('phone').focus(),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    isRequired: true,
                    hintText: 'Email',
                    label: 'Email',
                    validationMessages: {
                      ValidationMessage.required: (_) =>
                          'Email tidak boleh kosong!',
                      ValidationMessage.email: (_) => 'Email tidak valid!',
                    },
                  ),
                ),
                _Child(
                  'Dropdown Field',
                  child: BTDropdown<String?>(
                    formControl: form.control('genders'),
                    hintText: 'Jenis Kelamin',
                    label: 'Jenis Kelamin',
                    items: const [
                      DropdownMenuItem<String?>(
                        value: 'Male',
                        child: Text('Male'),
                      ),
                      DropdownMenuItem<String?>(
                        value: 'Female',
                        child: Text('Female'),
                      ),
                      DropdownMenuItem<String?>(
                        value: 'Non-Binary',
                        child: Text('Non-Binary'),
                      ),
                      DropdownMenuItem<String?>(
                        value: 'Prefer Not Mentioned',
                        child: Text('Prefer Not Mentioned'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Child extends StatelessWidget {
  const _Child(this.title, {required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: BTTextStyle.heading(),
        ),
        16.verticalSpace,
        child,
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
