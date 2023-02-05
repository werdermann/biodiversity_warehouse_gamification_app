import 'package:biodiversity/domain/model/species.dart';
import 'package:biodiversity/presentation/report/report_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslatedSpecies {
  const TranslatedSpecies({
    required this.index,
    required this.name,
  });

  final String name;
  final int index;
}

// TODO: Remove sheet when species selected
// TODO: Add close button
// TODO: Remove species field from step one
// TODO: Do same steps for the on boarding process

class SearchSpeciesSheet extends StatelessWidget {
  const SearchSpeciesSheet({super.key, required this.itemIndex});

  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportCubit>();

    final textTheme = Theme.of(context).textTheme;

    final speciesList = List<Species>.from(Species.values)..removeAt(0);
    // ..removeAt(0); // Remove not specified

    final translatedSpecies = speciesList
        .map(
          (species) => TranslatedSpecies(
            name: species.animalName.tr(),
            index: species.index,
          ),
        )
        .toList();

    // Sort alphabetically
    translatedSpecies.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    );

    // Add not specified
    translatedSpecies.insert(
      Species.notSpecified.index,
      TranslatedSpecies(
        index: Species.notSpecified.index,
        name: Species.notSpecified.animalName.tr(),
      ),
    );

    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('REPORT.CHOOSE_SPECIES'.tr(), style: textTheme.titleLarge),
          const SizedBox(height: 16),
          BlocBuilder<ReportCubit, ReportState>(
            builder: (context, state) {
              final cubit = context.read<ReportCubit>();

              final filteredSpecies = translatedSpecies
                  .where(
                    (species) => species.name.toLowerCase().contains(
                          state.searchSpeciesValue.toLowerCase(),
                        ),
                  )
                  .toList();

              return Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      initialValue: state.searchSpeciesValue,
                      onChanged: cubit.searchSpecies,
                      decoration: InputDecoration(
                        labelText: 'REPORT.SEARCH_SPECIES'.tr(),
                        hintText: 'REPORT.SEARCH_SPECIES_HINT'.tr(),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: filteredSpecies.length,
                        itemBuilder: (context, index) {
                          final species = filteredSpecies[index];

                          return ListTile(
                            trailing: const Icon(Icons.radio_button_off),
                            title: Text(species.name),
                            onTap: () => cubit.speciesChanged(
                              index: itemIndex,
                              speciesIndex: species.index,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          /*
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
              ),
              child: Text('REPORT.CHOOSE_SPECIES'.tr()),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
              ),
              child: Text('REPORT.CANCEL'.tr()),
            ),
            */
        ],
      ),
    );
  }
}
