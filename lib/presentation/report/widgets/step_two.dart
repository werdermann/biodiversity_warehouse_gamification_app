import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(51.509364, -0.128928),
          zoom: 9.2,
        ),
        nonRotatedChildren: const [],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ],
      ),
    );
  }
}
