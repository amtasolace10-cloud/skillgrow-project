import 'package:flutter/material.dart';
import 'package:skillgrow/core/widgets/widgets.dart';
import 'package:skillgrow/core/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _hide = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (_form.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, AppRoutes.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Welcome back',
      subtitle: 'Sign in to continue your streak.',
      showBack: false,
      children: [
        Form(
          key: _form,
          child: Column(children: [
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
              obscureText: _hide,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                    icon: Icon(_hide ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _hide = !_hide)),
              ),
              validator: (v) =>
                  (v == null || v.length < 6) ? 'At least 6 characters' : null,
            ),
          ]),
        ),
        gap(24),
        GradientButton(label: 'Log In', onPressed: _submit),
        gap(8),
        TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.signUp),
            child: const Text("New here? Create an account")),
      ],
    );
  }
}
