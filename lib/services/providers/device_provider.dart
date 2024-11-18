import 'dart:async';
import 'package:flutter/material.dart';

class Device {
  int id;
  String title;
  double consumption;
  double valueKWH;
  String temperature;
  String icon;
  bool isOn;
  bool isActive;
  double alert;
  double suspend;

  Device({
    required this.id,
    required this.title,
    required this.consumption,
    required this.valueKWH,
    required this.temperature,
    required this.icon,
    required this.isOn,
    required this.isActive,
    required this.alert,
    required this.suspend
  });
}

class DeviceProvider extends ChangeNotifier {
  List<Device> _devices = [];
  Device? _selectedDevice = null;

  void setSelected(Device device) {
    _selectedDevice = device;
    notifyListeners();
  }

  Device? getSelected() {
    return _selectedDevice;
  }
  // Inicializa el estado con datos iniciales
  void setDevices(List<Map<String, dynamic>> deviceData) {
    _devices = deviceData.map((data) {
      return Device(
        id: data['id'],
        title: data['title'],
        consumption: double.parse(data['consumption']),
        valueKWH: double.parse(data['valueKWH']),
        temperature: data['temperature'],
        icon: data['icon'],
        isOn: data['isOn'],
        isActive: data['isActive'],
        alert: double.parse(data['alert']),
        suspend: double.parse(data['suspend'])
      );
    }).toList();
    notifyListeners();
  }

  // Obtiene la lista de dispositivos
  List<Device> getDevices() {
    return _devices;
  }

  // Cambia el estado de isOn de un dispositivo específico
  void toggleDeviceState(int id) {
    final device = _devices.firstWhere((d) => d.id == id);
    device.isOn = !device.isOn;
    notifyListeners();
  }

  // Simula el aumento en el consumo de los dispositivos
  void simulateConsumption() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      _devices.forEach((device) {
        if (device.isOn && device.isActive) {
          double increment;
          switch (device.icon) {
            case 'refrigerator':
              increment = 0.5; // La nevera consume más
              break;
            case 'air_conditioner':
              increment = 0.8; // El aire acondicionado también consume mucho
              break;
            case 'lightbulb':
              increment = 0.1; // La bombilla consume menos
              break;
            case 'tv':
              increment = 0.2;
              break;
            case 'washing_machine':
              increment = 0.3;
              break;
            case 'microwave':
              increment = 0.4;
              break;
            case 'fan':
              increment = 0.2;
              break;
            case 'computer':
              increment = 0.3;
              break;
            default:
              increment = 0.1; // Por defecto, un bajo consumo
          }
          device.consumption += increment;
        }
      });
      notifyListeners(); // Notifica a los widgets para actualizar la UI
    });
  }
}
