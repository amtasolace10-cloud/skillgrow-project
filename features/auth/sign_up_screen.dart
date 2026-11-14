import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/core/routes/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Create account',
      subtitle: 'Start growing in under a minute.',
      showBack: false,
      children: [
        Form(
          key: _form,
          child: Column(children: [
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(
                  labelText: 'Full name', prefixIcon: Icon(Icons.person_outline)),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter your name' : null,
            ),
            gap(),
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Email', prefixIcon: Icon(Icons.mail_outline)),
              validator: (v) =>
                  (v == null || !v.contains('@')) ? 'Enter a valid email' : null,
            ),
            gap(),
            TextFormField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Password', prefixIcon: Icon(Icons.lock_outline)),
              validator: (v) =>
                  (v == null || v.length < 8) ? 'At least 8 characters' : null,
            ),
          ]),
        ),
        gap(24),
        GradientButton(
          label: 'Create Account',
          onPressed: () {
            if (_form.currentState!.validate()) {
              Navigator.pushReplacementNamed(context, AppRoutes.interests);
            }
          },
        ),
        gap(8),
        TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
            child: const Text('Already have an account? Log in')),
      ],
    );
  }
}
