import 'package:flutter/material.dart';

import '../styles/styles.dart';

class NavBar extends StatelessWidget {
  final Function(int) onItemTapped; // Función que se llamará al tocar un ícono
  final int currentIndex; // Índice actual seleccionado

  const NavBar({
    Key? key,
    required this.onItemTapped,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppStyles.darkBackgroundColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.devices),
          label: 'Devices',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'New Device',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: currentIndex, // Aquí se establece el índice actual
      selectedItemColor: AppStyles.primaryColor,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped, // Llama a la función proporcionada
      type: BottomNavigationBarType.fixed,
    );
  }
}
