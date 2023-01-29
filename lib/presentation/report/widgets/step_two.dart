import 'package:biodiversity/presentation/report/cubit/report_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportCubit>();

    final state = cubit.state;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: BlocBuilder<ReportCubit, ReportState>(
              buildWhen: (previous, current) =>
                  previous.location != current.location,
              builder: (context, state) {
                return FlutterMap(
                  mapController: cubit.mapController,
                  options: MapOptions(
                    center: LatLng(51.509364, -0.128928),
                    zoom: 9.2,
                    onTap: (_, position) {
                      cubit.setPositionManually(position);
                    },
                  ),
                  nonRotatedChildren: const [],
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add_location),
                const SizedBox(width: 8),
                Text('REPORT.STEP_2.SET_POSITION'.tr()),
              ],
            ),
          ),
          TextButton(
            onPressed: cubit.getCurrentLocation,
            child: Text(
              'REPORT.STEP_2.CURRENT_POSITION'.tr(),
            ),
          )
        ],
      ),
    );
  }
}
