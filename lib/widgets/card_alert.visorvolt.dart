import 'package:flutter/material.dart';
import 'package:visorvolt/styles/styles.dart';

class CardAlert extends StatelessWidget {
  final String title;

  const CardAlert({
    Key? key,
    required this.title,
  }) : super(key: key);

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
            Text(
              title.length > 20 ? '${title.substring(0, 20)}...' : title, // Limita el título
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: AppStyles.backgroundColor
              ),
              overflow: TextOverflow.ellipsis, // Asegura que se muestre correctamente
              maxLines: 1, // Limita a una línea
            ),
            SizedBox(width: 10.0),
            Icon(Icons.warning_amber_rounded, color: AppStyles.primaryColor,)
          ],
        ),
      ),
    );
  }
}
