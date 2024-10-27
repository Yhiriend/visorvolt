import 'package:flutter/material.dart';
import 'package:visorvolt/styles/styles.dart';

class CardDeviceList extends StatefulWidget {
  final String title;

  const CardDeviceList({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _CardDeviceListState createState() => _CardDeviceListState();
}

class _CardDeviceListState extends State<CardDeviceList> {
  bool _isChecked = false; // Estado del checkbox

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppStyles.darkBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Container(
        height: 60.0, // Altura fija de la tarjeta
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: _isChecked, // Valor del checkbox
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!; // Actualiza el estado
                });
              },
              activeColor: AppStyles.primaryColor,
            ),
            Expanded(
              child: Text(
                widget.title.length > 20 ? '${widget.title.substring(0, 20)}...' : widget.title, // Limita el título
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  color: AppStyles.backgroundColor,
                ),
                overflow: TextOverflow.ellipsis, // Asegura que se muestre correctamente
                maxLines: 1, // Limita a una línea
              ),
            ),
            SizedBox(width: 10.0),
            Icon(Icons.settings_outlined, color: AppStyles.textLightColor),
          ],
        ),
      ),
    );
  }
}
