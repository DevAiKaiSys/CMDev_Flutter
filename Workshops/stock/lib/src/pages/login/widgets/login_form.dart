import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock/src/config/theme.dart' as custom_theme;
import 'package:stock/src/utils/RegexValidator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  String? _errorUsername;
  String? _errorPassword;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController?.dispose();
    passwordController?.dispose();
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

  Card _buildForm() => Card(
        margin: EdgeInsets.only(left: 22.0, right: 22.0, bottom: 22.0),
        // shadow
        elevation: 2.0,
        color: Colors.white,
        // ขอบโค้ง
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 58.0, left: 28.0, right: 28.0),
          child: FormInput(
            usernameController: usernameController,
            passwordController: passwordController,
            errorUsername: _errorUsername,
            errorPassword: _errorPassword,
          ),
        ),
      );

  Container _buildSubmitFormButton() => Container(
        width: 220,
        height: 50,
        decoration: _boxDecoration(),
        child: TextButton(
          onPressed: () {
            String username = usernameController.text;
            String password = passwordController.text;

            _errorUsername = null;
            _errorPassword = null;

            if (!EmailSubmitRegexValidator().isValid(username)) {
              _errorUsername = 'The Email mute be a valid email.';
            }

            if (password.length < 8) {
              _errorPassword = 'Mute be at least 8 characters.';
            }

            if (_errorUsername == null && _errorPassword == null) {
              // print('form valid');
              setState(() {});
            } else {
              // print('form invalid');
              setState(() {});
            }
            // print(usernameController.text);
            // print(passwordController.text);
          },
          child: Text(
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
    final gradientStart = custom_theme.Theme.gradientStart;
    final gradientEnd = custom_theme.Theme.gradientEnd;

    final boxShadowItem = (Color color) => BoxShadow(
          color: color,
          offset: Offset(1.0, 6.0),
          blurRadius: 20.0,
        );

    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.0)), // ขอบโค้ง
      boxShadow: [
        // BoxShadow(
        //   color: gradientStart,
        //   offset: Offset(1.0, 6.0),
        //   blurRadius: 20.0,
        // ),
        // BoxShadow(
        //   color: gradientEnd,
        //   offset: Offset(1.0, 6.0),
        //   blurRadius: 20.0,
        // ),
        boxShadowItem(gradientStart),
        boxShadowItem(gradientEnd),
      ],
      gradient: LinearGradient(
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
  final String? errorUsername;
  final String? errorPassword;

  const FormInput({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.errorUsername,
    required this.errorPassword,
  });

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _color = Colors.black54;

  // // final usernameController = TextEditingController();
  // late TextEditingController usernameController;
  // late TextEditingController passwordController;
  //
  // @override
  // void initState() {
  //   usernameController = TextEditingController();
  //   passwordController = TextEditingController();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   // if (usernameController != null) {
  //   //   usernameController.dispose();
  //   // }
  //   usernameController?.dispose();
  //   passwordController?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUsername(),
        Divider(
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
        // controller: passwordController,
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
          errorText: widget.errorPassword,
        ),
        obscureText: true,
      );

  TextField _buildUsername() => TextField(
        // controller: usernameController,
        controller: widget.usernameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Email Address',
          hintText: 'email@mail.com',
          labelStyle: _textStyle(),
          icon: FaIcon(
            FontAwesomeIcons.envelope,
            size: 22.0,
            color: _color,
          ),
          errorText: widget.errorUsername,
        ),
      );
}
