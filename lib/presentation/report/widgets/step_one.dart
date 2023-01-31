import 'package:biodiversity/domain/model/evidence_status.dart';
import 'package:biodiversity/domain/model/species.dart';
import 'package:biodiversity/presentation/report/cubit/report_cubit.dart';
import 'package:biodiversity/presentation/report/widgets/species_comment_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportCubit>();

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
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
    );
  }

  Widget get _species {
    return BlocBuilder<ReportCubit, ReportState>(
      buildWhen: (previous, current) => previous.species != current.species,
      builder: (context, state) {
        final size = MediaQuery.of(context).size;

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final cubit = context.read<ReportCubit>();

            return Card(
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField(
                      value: state.species[index].species.index,
                      decoration: InputDecoration(
                        labelText: 'REPORT.STEP_1.SPECIES'.tr(),
                      ),
                      items: Species.values.map((Species species) {
                        return DropdownMenuItem(
                          value: species.index,
                          child: Text(
                            species.animalName.tr(),
                          ),
                        );
                      }).toList(),
                      onChanged: (speciesIndex) {
                        if (speciesIndex != null) {
                          cubit.speciesChanged(
                            index: index,
                            speciesIndex: speciesIndex,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField(
                      value: state.species[index].species.index,
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
                    ListTile(
                      title: Text('REPORT.COMMENT'.tr()),
                      trailing: IconButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: cubit,
                            child: SpeciesCommentDialog(
                              speciesIndex: index,
                            ),
                          ),
                        ),
                        icon: const Icon(Icons.comment),
                      ),
                    ),
                    if (state.species.length > 1)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Divider(),
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
