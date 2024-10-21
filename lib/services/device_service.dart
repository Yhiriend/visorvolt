import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceService {
  static const String _key = 'devices';
  final int delay = 3;
  Future<void> saveDevice(Map<String, dynamic> device) async {
    await Future.delayed(Duration(seconds: delay)); // Simula un retraso de 1 segundo
    final prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> devices = await getAllDevices();
    devices.add(device);
    await prefs.setString(_key, json.encode(devices));
  }

  Future<List<Map<String, dynamic>>> getAllDevices() async {
    await Future.delayed(Duration(seconds: delay)); // Simula un retraso de 1 segundo
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_key);
    print(jsonString);
    if (jsonString != null) {
      List<dynamic> jsonList = json.decode(jsonString);
      return List<Map<String, dynamic>>.from(jsonList);
    }
    return [];
  }

  Future<Map<String, dynamic>?> getDeviceById(int id) async {
    await Future.delayed(Duration(seconds: delay)); // Simula un retraso de 1 segundo
    List<Map<String, dynamic>> devices = await getAllDevices();
    return devices.firstWhere((device) => device['id'] == id, orElse: () => {});
  }

  Future<void> updateDevice(Map<String, dynamic> updatedDevice) async {
    await Future.delayed(Duration(seconds: delay)); // Simula un retraso de 1 segundo
    final prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> devices = await getAllDevices();
    int index = devices.indexWhere((device) => device['id'] == updatedDevice['id']);
    if (index != -1) {
      devices[index] = updatedDevice;
      await prefs.setString(_key, json.encode(devices));
    }
  }

  Future<void> disableDevice(int id) async {
    await Future.delayed(Duration(seconds: delay)); // Simula un retraso de 1 segundo
    List<Map<String, dynamic>> devices = await getAllDevices();
    int index = devices.indexWhere((device) => device['id'] == id);
    if (index != -1) {
      devices[index]['isActive'] = false; // Desactiva el dispositivo
      await updateDevice(devices[index]);
    }
  }
}
