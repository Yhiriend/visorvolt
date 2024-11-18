import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:visorvolt/services/providers/user_provider.dart';
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
    if (usernameController.text == "test" && passwordController.text == "test") {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser("Yirien Ortiz Urango", "yirien@email.com", "123456");
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
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned(
            top: 16.0,
            right: -150.0,
            child: SvgPicture.asset(
              'assets/logo.svg', // Ruta correcta del archivo SVG
              width: 200.0, // Ajusta el tamaño según sea necesario
              height: 200.0,
              color: AppStyles.primaryColor,
              fit: BoxFit.contain,
            ),
          ),
          // Contenido principal
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("VISORVOLT", style: TextStyle(color: AppStyles.textLightColor, fontSize: 40.0)),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Login to your account", style: TextStyle(color: AppStyles.textLightColor)),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  InputVisorvolt(controller: usernameController, placeholder: "Type your user", label: "username", isLoading: isLoading),
                  SizedBox(height: 16.0),
                  InputVisorvolt(controller: passwordController, placeholder: "Type your password", label: "password", isLoading: isLoading),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => {Navigator.pushReplacementNamed(context, '/register')},
                        child: Text("Create new account", style: TextStyle(color: AppStyles.textLightColor),),
                      )
                    ],
                  ),
                  SizedBox(height: 32.0),
                  ButtonVisorvolt(text: "Login", type: "success", onPressed: () => _onButtonPressed()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
