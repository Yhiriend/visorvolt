import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final bool initialState; // Estado inicial del interruptor
  final ValueChanged<bool> onChanged; // Callback para manejar cambios

  const SwitchButton({
    Key? key,
    required this.initialState,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  late bool _isOn; // Estado del interruptor

  @override
  void initState() {
    super.initState();
    _isOn = widget.initialState; // Inicializa el estado con el valor pasado
  }

  void _toggleSwitch() {
    setState(() {
      _isOn = !_isOn; // Cambia el estado
    });
    widget.onChanged(_isOn); // Notifica el cambio al padre
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch, // Cambia el estado al tocar
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200), // Duración de la animación
        width: 60, // Ancho del interruptor
        height: 30, // Alto del interruptor
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _isOn ? Colors.green : Colors.grey, // Color según el estado
        ),
        child: Align(
          alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 28, // Ancho del círculo
            height: 28, // Alto del círculo
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Color del círculo
            ),
          ),
        ),
      ),
    );
  }
}
