import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock_carch/configs/route.dart' as custom_route;
import 'package:mystock_carch/configs/theme.dart' as custom_theme;
import 'package:mystock_carch/presentation/utils/regex_validator.dart';

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
          passwordController: passwordController,
          errorUsername: _errorUsername,
          errorPassword: _errorPassword,
        ),
      ),
    );
  }

  Container _buildSubmitFormButton() => Container(
        width: 220,
        height: 50,
        decoration: _boxDecoration(),
        child: TextButton(
          onPressed: _onLogin,
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

  void showAlertBar() {
    Flushbar(
      title: "Username or Password is incorrect",
      message: "Please try again.",
      icon: const Icon(
        Icons.error,
        size: 28.0,
        color: Colors.red,
      ),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(8),
    ).show(context);
  }

  void showLoading() {
    Flushbar(
      message: 'Loading...',
      showProgressIndicator: true,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(context);
  }

  void _onLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    _errorUsername = null;
    _errorPassword = null;

    if (!EmailSubmitRegexValidator().isValid(username)) {
      _errorUsername = 'The Email mute be a valid email.';
    }

    if (password.length < 6) {
      _errorPassword = 'Must be at least 6 characters.';
    }

    if (_errorUsername == null && _errorPassword == null) {
      // debugPrint('form valid');
      showLoading();
      Future.delayed(const Duration(seconds: 2)).then((value) async {
        Navigator.pop(context);
        if (username == 'aikaisys@dev.com' && password == '1234567') {
          debugPrint('login successfully');
          /*// Navigator.push(
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(
                name: 'aikaisys',
                age: 30,
              ),
            ),
          );*/
          Navigator.pushReplacementNamed(
            context,
            custom_route.Route.home,
            arguments: {'name': 'aikaisys', 'age': 30},
          );
        } else {
          showAlertBar();
        }
        setState(() {});
      });
    } else {
      debugPrint('form invalid');
      setState(() {});
    }
  }

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

  late bool _obscureTextPassword;
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _obscureTextPassword = true;
    super.initState();
  }

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
        focusNode: _passwordFocusNode,
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
          suffixIcon: IconButton(
            icon: FaIcon(
              _obscureTextPassword
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash,
              color: _color,
              size: 15.0,
            ),
            onPressed: () {
              setState(() {
                _obscureTextPassword = !_obscureTextPassword;
              });
            },
          ),
        ),
        obscureText: _obscureTextPassword,
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
          errorText: widget.errorUsername,
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
      );
}
