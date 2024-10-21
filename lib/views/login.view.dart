import 'package:flutter/material.dart';
import 'package:visorvolt/styles/styles.dart';
import 'package:visorvolt/widgets/button.visorvolt.dart';
import 'package:visorvolt/widgets/input.visorvolt.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false; // Estado de carga
  Future<void> _onButtonPressed() async {
    setState(() {
      isLoading = true; // Cambiar a true al inicio
    });
    // Simulamos una tarea asíncrona
    await Future.delayed(Duration(seconds: 2));
    if(usernameController.text == "test" && usernameController.text == "test") {
      Navigator.pushReplacementNamed(context, '/home');
    }
    setState(() {
      isLoading = false; // Cambiar a false al finalizar
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.darkBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("VISORVOLT", style: TextStyle(color: AppStyles.textLightColor, fontSize: 40.0),),
              ],
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Login to your account", style: TextStyle(color: AppStyles.textLightColor),),
              ],
            ),
            SizedBox(height: 32.0),
            InputVisorvolt(controller: usernameController, placeholder: "Type your user", label: "username", isLoading: isLoading),
            SizedBox(height: 16.0),
            InputVisorvolt(controller: passwordController, placeholder: "Type your password", label: "password", isLoading: isLoading,),
            SizedBox(height: 32.0),
            ButtonVisorvolt(text: "Login", type: "success", onPressed: () => _onButtonPressed(),),
          ],
        ),
      ),
    );
  }
}
