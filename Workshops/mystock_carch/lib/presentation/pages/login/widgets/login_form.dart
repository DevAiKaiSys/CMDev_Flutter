import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock_carch/configs/theme.dart' as custom_theme;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildForm(),
        _buildSubmitFormButton(),
      ],
    );
  }

  Card _buildForm() {
    return Card(
      margin: const EdgeInsets.only(bottom: 22, left: 22, right: 22),
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 58, left: 28, right: 28),
        child: FormInput(
            usernameController: usernameController,
            passwordController: passwordController),
      ),
    );
  }

  Container _buildSubmitFormButton() => Container(
        width: 220,
        height: 50,
        decoration: _boxDecoration(),
        child: TextButton(
          onPressed: () {
            debugPrint(usernameController.text);
            debugPrint(passwordController.text);
          },
          child: const Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );

  BoxDecoration _boxDecoration() {
    const gradientStart = custom_theme.Theme.gradientStart;
    const gradientEnd = custom_theme.Theme.gradientEnd;

    boxShadowItem(Color color) => BoxShadow(
          color: color,
          offset: const Offset(1.0, 6.0),
          blurRadius: 20.0,
        );

    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      boxShadow: [
        boxShadowItem(gradientStart),
        boxShadowItem(gradientEnd),
      ],
      gradient: const LinearGradient(
        colors: [gradientEnd, gradientStart],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 1.0),
        stops: [0.0, 1.0],
      ),
    );
  }
}

class FormInput extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  const FormInput({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _color = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUsername(),
        const Divider(
          height: 22,
          thickness: 1,
          indent: 13,
          endIndent: 13,
        ),
        _buildPassword(),
      ],
    );
  }

  TextStyle _textStyle() => TextStyle(
        fontWeight: FontWeight.w500,
        color: _color,
      );

  TextField _buildPassword() => TextField(
        controller: widget.passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Password',
          labelStyle: _textStyle(),
          icon: FaIcon(
            FontAwesomeIcons.lock,
            size: 22.0,
            color: _color,
          ),
        ),
        obscureText: true,
      );

  TextField _buildUsername() => TextField(
        controller: widget.usernameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Email Address',
          labelStyle: _textStyle(),
          hintText: 'aikaisys@dev.com',
          icon: FaIcon(
            FontAwesomeIcons.envelope,
            size: 22.0,
            color: _color,
          ),
        ),
      );
}
