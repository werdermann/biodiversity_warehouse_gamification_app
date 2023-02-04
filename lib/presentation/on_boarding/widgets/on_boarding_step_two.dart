import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/presentation/on_boarding/on_boarding.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

class OnBoardingStepTwo extends StatelessWidget {
  const OnBoardingStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: _leafletMap,
            ),
            const SizedBox(height: 32),
            Text('REPORT.STEP_2.INSTRUCTIONS'.tr()),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: cubit.getCurrentLocation,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add_location),
                  const SizedBox(width: 8),
                  Text('REPORT.STEP_2.CURRENT_POSITION'.tr()),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _locationComment,
          ],
        ),
      ),
    );
  }

  Widget get _leafletMap {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      buildWhen: (previous, current) => previous.location != current.location,
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();

        final hasStartLocation = state.location != null;

        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FlutterMap(
            mapController: cubit.mapController,
            options: MapOptions(
              keepAlive: true,
              center: state.location,
              zoom: Constants.zoomLevel,
              onTap: (_, position) {
                cubit.setPositionManually(position);
              },
            ),
            nonRotatedChildren: const [],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              hasStartLocation
                  ? MarkerLayer(
                      markers: [
                        Marker(
                          point: state.location!,
                          builder: (_) => const Icon(
                            Icons.location_pin,
                            size: 32,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  Widget get _locationComment {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      buildWhen: (previous, current) =>
          previous.locationComment != current.locationComment,
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();

        return TextFormField(
          initialValue: state.locationComment,
          onChanged: cubit.locationCommentChanged,
          decoration: InputDecoration(
            labelText: 'REPORT.STEP_2.PLACE_COMMENT'.tr(),
          ),
        );
      },
    );
  }
}
