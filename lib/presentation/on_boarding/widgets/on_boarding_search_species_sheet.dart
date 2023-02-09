import 'package:biodiversity/domain/model/species.dart';
import 'package:biodiversity/presentation/on_boarding/on_boarding_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class TranslatedSpecies {
  const TranslatedSpecies({
    required this.index,
    required this.name,
  });

  final String name;
  final int index;
}

class OnBoardingSearchSpeciesSheet extends StatelessWidget {
  const OnBoardingSearchSpeciesSheet({super.key, required this.itemIndex});

  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final speciesList = List<Species>.from(Species.values)..removeAt(0);

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

    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listenWhen: (previous, current) =>
          previous.selectSpeciesStatus != current.selectSpeciesStatus,
      listener: (context, state) {
        if (state.selectSpeciesStatus.isSubmissionSuccess) {
          Navigator.pop(context);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'REPORT.CHOOSE_SPECIES'.tr(),
                    style: textTheme.titleLarge,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BlocBuilder<OnBoardingCubit, OnBoardingState>(
              builder: (context, state) {
                final cubit = context.read<OnBoardingCubit>();

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
                        onChanged: cubit.searchSpecies,
                        controller: cubit.searchSpeciesController,
                        decoration: InputDecoration(
                          labelText: 'REPORT.SEARCH_SPECIES'.tr(),
                          hintText: 'REPORT.SEARCH_SPECIES_HINT'.tr(),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: AnimatedOpacity(
                            opacity: state.searchSpeciesValue.isEmpty ? 0 : 1,
                            duration: const Duration(milliseconds: 100),
                            child: IconButton(
                              onPressed: cubit.resetSpeciesSearch,
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 16),
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
          ],
        ),
      ),
    );
  }
}
