import 'package:flutter/material.dart';
import 'package:visorvolt/styles/styles.dart';
import 'package:visorvolt/widgets/input.visorvolt.dart';

import '../widgets/button.visorvolt.dart';
import '../widgets/switch.visortvolt.dart';

class DeviceDetailView extends StatefulWidget {
  @override
  _DeviceDetailViewState createState() => _DeviceDetailViewState();
}

class _DeviceDetailViewState extends State<DeviceDetailView> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  TextEditingController _deviceName = TextEditingController();
  TextEditingController _key = TextEditingController();
  TextEditingController _alertThreshold = TextEditingController();
  TextEditingController _suspendThreshold = TextEditingController();
  TextEditingController _valueKWH = TextEditingController();
  bool _switchState = true; // Estado del interruptor

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

  void _handleSwitchChange(bool newValue) {
    setState(() {
      _switchState = newValue; // Actualiza el estado al cambiar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurar dispositivo', style: TextStyle(color: AppStyles.textLightColor),),
        backgroundColor: AppStyles.darkBackgroundColor,
        leading: GestureDetector(
            onTap: () => {Navigator.pop(context)},
            child: Icon(Icons.arrow_back, color: AppStyles.textLightColor,)
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.kitchen_outlined, size: 100, color: AppStyles.textColor,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Nevera", style: TextStyle(color: AppStyles.textColor, fontWeight: FontWeight.bold, fontSize: 30.0),),
                        Row(
                          children: [
                            Text("Estado: "),
                            Text(
                              _switchState ? "on" : "off",
                              style: TextStyle(
                                  color: _switchState ? AppStyles.stateOn:AppStyles.stateOff,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("Consumo: "),
                            Text("49.21  "),
                            Text("kWh")
                          ],
                        ),
                        Row(
                          children: [
                            Text("Valor: "),
                            Text("\$10 341.48"),
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    SwitchButton(
                      initialState: _switchState, // Pasa el estado inicial
                      onChanged: _handleSwitchChange,
                    )
                  ],
                ),
                SizedBox(height: 30,),
                InputVisorvolt(
                  prefixIcon: Icons.emoji_objects,
                  isLoading: isLoading,
                  controller: _deviceName,
                  placeholder: "Ingresa el nombre del dispositivo",
                  label: "Nombre del dispositivo",
                  theme: "dark",
                ),
                SizedBox(height: 10),
                InputVisorvolt(
                  prefixIcon: Icons.alarm,
                  isLoading: isLoading,
                  controller: _alertThreshold,
                  placeholder: "Alertar en (kWh)",
                  label: "Alertar en (kWh)",
                  inputType: TextInputType.number,
                  theme: "dark",
                ),
                SizedBox(height: 10),
                InputVisorvolt(
                  prefixIcon: Icons.offline_bolt,
                  isLoading: isLoading,
                  controller: _suspendThreshold,
                  placeholder: "Suspender en (kWh)",
                  label: "Suspender en (kWh)",
                  inputType: TextInputType.number,
                  theme: "dark",
                ),
                SizedBox(height: 10),
                InputVisorvolt(
                  prefixIcon: Icons.monetization_on_outlined,
                  isLoading: isLoading,
                  controller: _valueKWH,
                  placeholder: "Valor del kWh",
                  label: "Valor del kWh",
                  inputType: TextInputType.number,
                  theme: "dark",
                ),
                SizedBox(height: 30),
                ButtonVisorvolt(text: "Desvincular", type: "cancel", onPressed: () => _onButtonPressed(),),
                SizedBox(height: 20.0,),
                ButtonVisorvolt(text: "Guardar cambios", type: "success", onPressed: () => _onButtonPressed(),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
