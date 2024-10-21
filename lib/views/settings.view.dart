import 'package:flutter/material.dart';
import 'package:visorvolt/styles/styles.dart';
import 'package:visorvolt/widgets/input.visorvolt.dart';

import '../widgets/button.visorvolt.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  TextEditingController _name = TextEditingController();
  TextEditingController _birthdate = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isLoading = false;
  Future<void> _onButtonPressed() async {
    setState(() {
      isLoading = true; // Cambiar a true al inicio
    });
    // Simulamos una tarea asíncrona
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = false; // Cambiar a false al finalizar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración', style: TextStyle(color: AppStyles.textLightColor),),
        backgroundColor: AppStyles.darkBackgroundColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => {
                Navigator.pushReplacementNamed(context, '/')
              },
              child: Icon(Icons.output_rounded, color: AppStyles.textLightColor,),
            ),)
        ],
      ),
      body: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.manage_accounts_rounded, size: 100, color: AppStyles.textColor,)
                    ],
                  ),
                  SizedBox(height: 30,),
                  InputVisorvolt(
                    prefixIcon: Icons.person,
                    isLoading: isLoading,
                    controller: _name,
                    placeholder: "Ingresa tu nombre",
                    label: "Nombre",
                    theme: "dark",),
                  SizedBox(height: 10,),
                  InputVisorvolt(
                    prefixIcon: Icons.cake_rounded,
                    isLoading: isLoading,
                    controller: _birthdate,
                    placeholder: "Ingresa tu fecha de nacimiento",
                    label: "Fecha de nacimiento",
                    theme: "dark",),
                  SizedBox(height: 10,),
                  InputVisorvolt(
                    prefixIcon: Icons.safety_divider,
                    isLoading: isLoading,
                    controller: _gender,
                    placeholder: "Ingresa tu género",
                    label: "Género",
                    theme: "dark",),
                  SizedBox(height: 10,),
                  InputVisorvolt(
                    prefixIcon: Icons.mail_rounded,
                    isLoading: isLoading,
                    controller: _email,
                    placeholder: "Ingresa tu correo",
                    label: "Correo",
                    theme: "dark",),
                  SizedBox(height: 10,),
                  InputVisorvolt(
                    prefixIcon: Icons.lock,
                    isLoading: isLoading,
                    controller: _password,
                    placeholder: "Ingresa una nueva contraseña",
                    label: "Contraseña",
                    theme: "dark",),
                  SizedBox(height: 30),
                  ButtonVisorvolt(text: "Guardar cambios", type: "success", onPressed: () => _onButtonPressed(),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
