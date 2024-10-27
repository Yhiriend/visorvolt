import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visorvolt/styles/styles.dart';

import '../widgets/card_device_list.visorvolt.dart';

class DevicesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Dispositivos", style: TextStyle(color: AppStyles.textLightColor),),
        backgroundColor: AppStyles.darkBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Marca los dispositivos que quieres que siempre se muestren en la pantalla de inicio (máximo 3)."),
              SizedBox(height: 20.0,),
              Container(
                child: Column(
                  children: [
                    CardDeviceList(title: "Nevera",),
                    CardDeviceList(title: "Bombilla Sala",),
                    CardDeviceList(title: "Aire Acondicionado",),
                    CardDeviceList(title: "Bombilla Hab1",),
                    CardDeviceList(title: "Bombilla Hab2",)
                  ],
                ),
              )
            ],
          ),
        )
      ),
    ));
  }
}