import 'package:flutter/material.dart';
import '../constants/devices.dart';
import '../styles/styles.dart';
import '../utils/get_icon.utils.dart';
import '../widgets/card_alert.visorvolt.dart';
import '../widgets/card_device.visorvolt.dart';
import '../widgets/circle_painter.visorvolt.dart';
import 'device_detail.view.dart';

class HomeView extends StatelessWidget {
  final VoidCallback onCardAddDeviceTap;
  final VoidCallback onAllDeviceTap;
  const HomeView({
    Key? key,
    required this.onCardAddDeviceTap,
    required this.onAllDeviceTap
}): super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double halfScreenHeight = MediaQuery.of(context).size.height / 2;

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
                          "21 de octubre de 2023",
                          style: TextStyle(color: AppStyles.textLightColor, fontSize: 18.0, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),),
                    Padding(padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0), child:Row(
                      children: [
                        Text(
                          "Hola, Yirien",
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
                            ...deviceData.take(3).map((device) {
                            return CardDevice(
                              title: device['title'],
                              consumption: device['consumption'],
                              valueKWH: device['valueKWH'] ?? "0",
                              temperature: device['temperature'],
                              icon: getIcon(device['icon']),
                              isOn: device['isOn'],
                              onTap: () => {
                                print("on tap ${device['title']}"),
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
