import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visorvolt/styles/styles.dart';

class CardDevice extends StatelessWidget {
  final String title;
  final String consumption;
  final String valueKWH;
  final String temperature;
  final IconData icon;
  final bool isOn;
  final VoidCallback onTap;

  const CardDevice({
    Key? key,
    required this.title,
    required this.consumption,
    required this.valueKWH,
    required this.temperature,
    required this.icon,
    required this.isOn,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double monetaryValue = double.parse(consumption) * double.parse(valueKWH);

    // Formatea el valor monetario con separación de miles y 2 decimales
    var formattedValue = NumberFormat.currency(locale: 'en_ES', symbol: '\$').format(monetaryValue);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppStyles.backgroundColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        child: Container(
          height: 240.0, // Altura fija de la tarjeta
          width: 170.0,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.length > 12 ? '${title.substring(0, 12)}...' : title, // Limita el título
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis, // Asegura que se muestre correctamente
                maxLines: 1, // Limita a una línea
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 60.0, color: isOn ? AppStyles.stateOn : AppStyles.stateOff,),
                  SizedBox(height: 5.0),
                  Text(
                    (isOn ? "on" : "off"),
                    style: TextStyle(
                        color: isOn ? AppStyles.stateOn : AppStyles.stateOff,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                "${double.parse(consumption)} kWh",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    formattedValue,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
