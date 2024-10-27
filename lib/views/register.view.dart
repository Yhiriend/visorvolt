import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Asegúrate de usar el paquete correcto
import 'package:visorvolt/styles/styles.dart';
import 'package:visorvolt/widgets/button.visorvolt.dart';
import 'package:visorvolt/widgets/input.visorvolt.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false; // Estado de carga

  Future<void> _onRegisterButtonPressed() async {
    setState(() {
      isLoading = true; // Cambiar a true al inicio
    });
    // Simulamos una tarea asíncrona
    await Future.delayed(Duration(seconds: 2));

    // Aquí puedes añadir la lógica para registrar al usuario
    // Ejemplo de validación básica
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      // Navegar a la vista de inicio (o donde desees)
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
          // Imagen de fondo (opcional)
          Positioned(
            top: 16.0,
            right: -150.0,
            child: SvgPicture.asset(
              'assets/logo.svg', // Ruta correcta del archivo SVG
              width: 200.0,
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
                      Text("Register", style: TextStyle(color: AppStyles.textLightColor, fontSize: 40.0)),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  InputVisorvolt(controller: firstNameController, placeholder: "Nombre", label: "Nombre", isLoading: isLoading),
                  SizedBox(height: 16.0),
                  InputVisorvolt(controller: lastNameController, placeholder: "Apellido", label: "Apellido", isLoading: isLoading),
                  SizedBox(height: 16.0),
                  InputVisorvolt(controller: emailController, placeholder: "Correo", label: "Correo", isLoading: isLoading),
                  SizedBox(height: 16.0),
                  InputVisorvolt(controller: passwordController, placeholder: "Contraseña", label: "Contraseña", isLoading: isLoading),
                  SizedBox(height: 32.0),
                  ButtonVisorvolt(text: "Register", type: "success", onPressed: () => _onRegisterButtonPressed()),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Aquí puedes navegar a la vista de inicio de sesión
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        child: Text("Already have an account? Login", style: TextStyle(color: AppStyles.textLightColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
