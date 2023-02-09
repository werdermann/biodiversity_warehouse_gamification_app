import 'package:biodiversity/domain/model/evidence_status.dart';
import 'package:biodiversity/presentation/on_boarding/on_boarding_cubit.dart';
import 'package:biodiversity/presentation/on_boarding/widgets/on_boarding_search_species_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingStepOne extends StatelessWidget {
  const OnBoardingStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SafeArea(
        top: false,
        child: Container(
          width: size.width,
          padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _species,
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: cubit.addSpeciesEntry,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.add),
                    const SizedBox(width: 8),
                    Text(
                      'REPORT.STEP_1.ADD_SPECIES'.tr(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget get _species {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      buildWhen: (previous, current) => previous.species != current.species,
      builder: (context, state) {
        final size = MediaQuery.of(context).size;

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final cubit = context.read<OnBoardingCubit>();

            return Card(
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text('REPORT.STEP_1.SPECIES'.tr()),
                      subtitle: Text(
                        state.species[index].species.animalName.tr(),
                      ),
                      trailing: IconButton(
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => BlocProvider.value(
                            value: cubit,
                            child: OnBoardingSearchSpeciesSheet(
                              itemIndex: index,
                            ),
                          ),
                        ),
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField(
                      value: state.species[index].evidenceStatus.index,
                      decoration: InputDecoration(
                        labelText: 'REPORT.STEP_1.STATUS'.tr(),
                      ),
                      isExpanded: true,
                      items: EvidenceStatus.values.map(
                        (EvidenceStatus status) {
                          return DropdownMenuItem(
                            value: status.index,
                            child: Text(
                              status.methodName.tr(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (evidenceStatusIndex) {
                        if (evidenceStatusIndex != null) {
                          cubit.evidenceMethodChanged(
                            index: index,
                            evidenceStatusIndex: evidenceStatusIndex,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      title: Text('REPORT.STEP_1.AMOUNT'.tr()),
                      subtitle: Text('${state.species[index].count}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: state.species[index].count == 1
                                ? null
                                : () => cubit.removeSpeciesCount(index: index),
                            icon: const Icon(Icons.remove),
                          ),
                          IconButton(
                            onPressed: () => cubit.addSpeciesCount(
                              index: index,
                            ),
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<OnBoardingCubit, OnBoardingState>(
                      buildWhen: (previous, current) =>
                          previous.species[index].comment !=
                          current.species[index].comment,
                      builder: (context, state) {
                        return TextFormField(
                          initialValue: state.species[index].comment,
                          onChanged: (value) => cubit.speciesCommentChanged(
                            index: index,
                            value: value,
                          ),
                          decoration: InputDecoration(
                            labelText: 'REPORT.STEP_1.COMMENT'.tr(),
                          ),
                        );
                      },
                    ),
                    if (state.species.length > 1)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () => cubit.removeEntry(index),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.delete),
                                const SizedBox(width: 8),
                                Text('REPORT.STEP_1.REMOVE_ENTRY'.tr()),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemCount: state.species.length,
        );
      },
    );
  }
}
