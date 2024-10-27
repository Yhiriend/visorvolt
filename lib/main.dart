import 'package:flutter/material.dart';
import 'package:visorvolt/styles/styles.dart';
import 'package:visorvolt/views/add_device.view.dart';
import 'package:visorvolt/views/devices.view.dart';
import 'package:visorvolt/views/login.view.dart';
import 'package:visorvolt/views/home.view.dart';
import 'package:visorvolt/views/register.view.dart';
import 'package:visorvolt/views/settings.view.dart';
import 'package:visorvolt/widgets/navbar.visorvolt.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        '/register': (context) => RegisterView(),
        '/home': (context) => MainHomeView(), // Cambia la ruta a MainHomeView
      },
    );
  }
}

class MainHomeView extends StatefulWidget {
  @override
  _MainHomeViewState createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  int _selectedIndex = 0; // Índice de la vista seleccionada

  // Lista de vistas correspondientes a los íconos del NavBar
  late List<Widget> _views = [
    HomeView(onCardAddDeviceTap: () {
      _onItemTapped(2);
    }, onAllDeviceTap: () {
      _onItemTapped(1);
    },),
    DevicesView(),
    NewDeviceView(),
    SettingsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza la vista seleccionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.darkBackgroundColor,
      body: _views[_selectedIndex], // Muestra la vista seleccionada
      bottomNavigationBar: NavBar(onItemTapped: _onItemTapped, currentIndex: _selectedIndex,), // Pasa la función al NavBar
    );
  }
}
