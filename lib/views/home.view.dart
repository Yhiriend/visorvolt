import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visorvolt/services/providers/device_provider.dart';
import 'package:visorvolt/services/providers/user_provider.dart';
import '../constants/devices.dart';
import '../styles/styles.dart';
import '../utils/get_icon.utils.dart';
import '../widgets/card_alert.visorvolt.dart';
import '../widgets/card_device.visorvolt.dart';
import '../widgets/circle_painter.visorvolt.dart';
import 'device_detail.view.dart';

class HomeView extends StatefulWidget {
  final VoidCallback onCardAddDeviceTap;
  final VoidCallback onAllDeviceTap;

  const HomeView({
    Key? key,
    required this.onCardAddDeviceTap,
    required this.onAllDeviceTap
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  get onCardAddDeviceTap => null;

  get onAllDeviceTap => null;

  @override
  void initState() {
    super.initState();
    final deviceProvider = Provider.of<DeviceProvider>(context, listen: false);
    deviceProvider.setDevices(deviceData);  // Inicializa los dispositivos
    deviceProvider.simulateConsumption();   // Comienza a simular el consumo
  }


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double halfScreenHeight = MediaQuery.of(context).size.height / 2;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userName = userProvider.getUser()?.name.split(" ")[0] ?? "User Undefined";
    final deviceProvider = Provider.of<DeviceProvider>(context, listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2 / 3,
              child: RotatedBox(
                quarterTurns: 2,
                child: CustomPaint(
                  foregroundPainter: CirclePainter(AppStyles.darkBackgroundColor),
                ),
              ),
            ),
          ),
          // Contenido principal
          Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0), child: Row(
                      children: [
                        Text(
                          "18 de noviembre de 2024",
                          style: TextStyle(color: AppStyles.textLightColor, fontSize: 18.0, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),),
                    Padding(padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0), child:Row(
                      children: [
                        Text(
                          "Hola, $userName",
                          style: TextStyle(color: AppStyles.textLightColor, fontSize: 30.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                        [
                          Text(
                            "Dispositivos",
                            style: TextStyle(color: AppStyles.textLightColor, fontSize: 20.0),),
                          GestureDetector(
                            onTap: onAllDeviceTap,
                            child: Text(
                              "ver todos",
                              style: TextStyle(color: AppStyles.textLightColor, fontSize: 16.0),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250.0, // Altura del ScrollView
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...deviceProvider.getDevices().take(3).map((device) {
                            return CardDevice(
                              title: device.title,
                              consumption: device.consumption.toStringAsFixed(2).toString(),
                              valueKWH: device.valueKWH.toString(),
                              temperature: device.temperature,
                              icon: getIcon(device.icon),
                              isOn: device.isOn,
                              onTap: () => {
                                print("on tap ${device.title}"),
                                deviceProvider.setSelected(device),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DeviceDetailView())
                                )
                              }
                            );
                          }).toList(),
                          GestureDetector(
                            onTap: onCardAddDeviceTap,
                            child: Card(
                              color: AppStyles.backgroundColor.withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                              child: Container(
                                height: 200.0, // Altura fija de la tarjeta
                                width: 140.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add, color: AppStyles.textColor, size: 60,)
                                  ],
                                ),
                              ),
                            ),
                          )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children:
                      [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                          child: Text(
                            "Alertas",
                            style: TextStyle(color: AppStyles.textColor, fontSize: 20.0),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                        child: Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                CardAlert(
                                  title: "Nevera",
                                ),
                                CardAlert(
                                  title: "Bombilla Sala",
                                ),
                                CardAlert(
                                  title: "Aire Acondicionado",
                                ),
                                CardAlert(
                                  title: "Nevera",
                                ),
                              ],
                            ),
                          ),
                        ),
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    ));
  }
}
