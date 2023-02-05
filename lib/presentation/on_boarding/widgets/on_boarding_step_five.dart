import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/presentation/on_boarding/on_boarding_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

class OnBoardingStepFive extends StatelessWidget {
  const OnBoardingStepFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _details,
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: _location,
                ),
                const SizedBox(width: 16),
                Expanded(child: _images),
              ],
            ),
            const SizedBox(height: 16),
            _methodDetails,
          ],
        ),
      ),
    );
  }

  Widget get _details {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        final textTheme = Theme.of(context).textTheme;

        return Card(
          child: Container(
            width: size.width,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text('REPORT.STEP_5.DETAILS'.tr(), style: textTheme.titleSmall),
                const SizedBox(height: 8),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final speciesEntry = state.species[index];

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _detailItem(
                          category: 'REPORT.STEP_5.SPECIES'.tr(),
                          content: speciesEntry.species.animalName.tr(),
                        ),
                        _detailItem(
                          category: 'REPORT.STEP_5.AMOUNT'.tr(),
                          content: '${speciesEntry.count}',
                        ),
                        _detailItem(
                          category: 'REPORT.STEP_5.STATUS'.tr(),
                          content: speciesEntry.evidenceStatus.methodName.tr(),
                        ),
                        _detailItem(
                          category: 'REPORT.STEP_5.COMMENT'.tr(),
                          content: speciesEntry.comment.isNotEmpty
                              ? speciesEntry.comment
                              : 'REPORT.STEP_5.NO_COMMENT'.tr(),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(height: 32);
                  },
                  itemCount: state.species.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _detailItem({required String category, required String content}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            category,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(flex: 2, child: Text(content)),
      ],
    );
  }

  Widget get _location {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      buildWhen: (previous, current) => previous.location != current.location,
      builder: (context, state) {
        final textTheme = Theme.of(context).textTheme;

        final hasStartLocation = state.location != null;

        return Card(
          child: Container(
            height: 170,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'REPORT.STEP_5.PLACE'.tr(),
                  style: textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FlutterMap(
                      // mapController: cubit.summaryMapController,
                      // mapController: cubit.mapController,
                      options: MapOptions(
                        interactiveFlags: InteractiveFlag.none,
                        center: state.location,
                        zoom: Constants.zoomLevel,
                      ),
                      nonRotatedChildren: const [],
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget get _images {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      buildWhen: (previous, current) => previous.images != current.images,
      builder: (context, state) {
        final textTheme = Theme.of(context).textTheme;

        return Card(
          child: Container(
            height: 170,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('REPORT.STEP_5.IMAGES'.tr(), style: textTheme.titleSmall),
                const SizedBox(height: 8),
                Expanded(
                  child: state.images.isNotEmpty
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final file = state.images[index];

                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(file),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 16);
                          },
                          itemCount: state.images.length,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.info_outline),
                            Text(
                              'REPORT.STEP_5.NO_IMAGES'.tr(),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget get _methodDetails {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      buildWhen: (previous, current) =>
          previous.date != current.date ||
          previous.methodComment != current.methodComment ||
          previous.reportMethod != current.reportMethod,
      builder: (context, state) {
        final textTheme = Theme.of(context).textTheme;

        return Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'REPORT.STEP_5.METHOD_DETAILS'.tr(),
                  style: textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                _detailItem(
                  category: 'REPORT.STEP_5.DATE'.tr(),
                  content: state.date.toString(),
                ),
                _detailItem(
                  category: 'REPORT.STEP_5.METHOD'.tr(),
                  content: state.reportMethod.message.tr(),
                ),
                _detailItem(
                  category: 'REPORT.STEP_5.COMMENT'.tr(),
                  content: state.methodComment.isNotEmpty
                      ? state.methodComment
                      : 'REPORT.STEP_5.NO_COMMENT'.tr(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
