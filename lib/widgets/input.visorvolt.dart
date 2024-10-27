import 'package:flutter/material.dart';
import 'package:visorvolt/styles/styles.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart'; // Asegúrate de agregar intl en tu pubspec.yaml

class InputVisorvolt extends StatelessWidget {
  final String placeholder;
  final IconData? prefixIcon; // Hacemos que sea opcional
  final IconData? suffixIcon; // Hacemos que sea opcional
  final String label;
  final TextEditingController? controller;
  final String theme; // Parámetro para el tema (light o dark)
  final bool isLoading; // Nuevo parámetro para indicar si está cargando
  final TextInputType inputType;
  final bool isCurrency; // Nuevo parámetro para indicar si es una cantidad de dinero

  const InputVisorvolt({
    Key? key,
    required this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    required this.label,
    this.controller,
    this.theme = 'light', // Por defecto es light
    this.isLoading = false, // Por defecto es false
    this.inputType = TextInputType.text,
    this.isCurrency = false, // Por defecto es false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define los colores según el tema
    final borderColor = theme == 'light' ? AppStyles.textLightColor : AppStyles.textColor;

    // Si está cargando, mostrar el contenedor animado
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: SizedBox(
          height: 56.0, // Altura del "pulso"
          width: double.infinity, // Ancho completo
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey, // Color del pulso
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }

    // Formatear el texto al cambiarlo
    void _onChanged(String value) {
      if (isCurrency) {
        // Si es una cantidad de dinero, se formatea con dos decimales
        double? doubleValue = double.tryParse(value.replaceAll(',', ''));
        if (doubleValue != null) {
          String formattedValue = NumberFormat.currency(locale: 'es_ES', decimalDigits: 2).format(doubleValue);
          controller?.text = formattedValue;
          controller?.selection = TextSelection.fromPosition(TextPosition(offset: formattedValue.length));
        }
      } else {
        // Solo separa miles
        String formattedValue = NumberFormat('#,###').format(int.tryParse(value.replaceAll(',', '')));
        controller?.text = formattedValue;
        controller?.selection = TextSelection.fromPosition(TextPosition(offset: formattedValue.length));
      }
    }

    // Si no está cargando, mostrar el TextField
    return TextField(
      controller: controller,
      keyboardType: inputType,
      onChanged: _onChanged, // Asigna la función para formatear al cambiar
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        labelStyle: TextStyle(color: theme == 'light' ? AppStyles.textLightColor : AppStyles.textColor, fontWeight: FontWeight.normal),
        hintStyle: TextStyle(color: theme == 'light' ? Colors.white24 : AppStyles.textColor, fontWeight: FontWeight.normal),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: borderColor) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: borderColor) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppStyles.primaryColor),
        ),
      ),
      style: TextStyle(color: theme == 'light' ? AppStyles.textLightColor : AppStyles.textColor), // Color del texto
      cursorColor: AppStyles.primaryColor, // Color del cursor
    );
  }
}
