import 'package:flutter/material.dart';
import 'package:visorvolt/styles/styles.dart';
import 'package:visorvolt/widgets/input.visorvolt.dart';
import 'package:visorvolt/widgets/button.visorvolt.dart';

class NewDeviceView extends StatefulWidget {
  @override
  _NewDeviceViewState createState() => _NewDeviceViewState();
}

class _NewDeviceViewState extends State<NewDeviceView> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  TextEditingController _deviceName = TextEditingController();
  TextEditingController _key = TextEditingController();
  TextEditingController _alertThreshold = TextEditingController();
  TextEditingController _suspendThreshold = TextEditingController();
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
        title: Text('Nuevo Dispositivo', style: TextStyle(color: AppStyles.textLightColor)),
        backgroundColor: AppStyles.darkBackgroundColor,
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
                      Icon(Icons.device_hub, size: 100, color: AppStyles.textColor),
                    ],
                  ),
                  SizedBox(height: 30),
                  InputVisorvolt(
                    prefixIcon: Icons.device_hub,
                    isLoading: isLoading,
                    controller: _deviceName,
                    placeholder: "Ingresa el nombre del dispositivo",
                    label: "Nombre del dispositivo",
                    theme: "dark",
                  ),
                  SizedBox(height: 10),
                  InputVisorvolt(
                    prefixIcon: Icons.key,
                    isLoading: isLoading,
                    controller: _key,
                    placeholder: "Ingresa la llave",
                    label: "Llave",
                    theme: "dark",
                  ),
                  SizedBox(height: 10),
                  InputVisorvolt(
                    prefixIcon: Icons.alarm,
                    isLoading: isLoading,
                    controller: _alertThreshold,
                    placeholder: "Alertar en (kWh)",
                    label: "Alertar en (kWh)",
                    theme: "dark",
                  ),
                  SizedBox(height: 10),
                  InputVisorvolt(
                    prefixIcon: Icons.offline_bolt,
                    isLoading: isLoading,
                    controller: _suspendThreshold,
                    placeholder: "Suspender en (kWh)",
                    label: "Suspender en (kWh)",
                    theme: "dark",
                  ),
                  SizedBox(height: 30),
                  ButtonVisorvolt(
                    text: "Registrar Dispositivo",
                    type: "success",
                    onPressed: () => _onButtonPressed(),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
