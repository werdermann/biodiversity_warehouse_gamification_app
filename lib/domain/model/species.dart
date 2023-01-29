enum Species {
  notSpecified(
    animalName: 'ANIMALS.NOT_SPECIFIED',
    imagePath: 'assets/images/animals/squirrel',
  ),
  squirrel(
    animalName: 'ANIMALS.SQUIRREL',
    imagePath: 'assets/images/animals/squirrel',
  ),
  hedgehog(
    animalName: 'ANIMALS.HEDGEHOG',
    imagePath: 'assets/images/animals/squirrel',
  ),
  moose(
    animalName: 'ANIMALS.MOOSE',
    imagePath: 'assets/images/animals/squirrel',
  );

  const Species({
    required this.animalName,
    required this.imagePath,
  });

  final String imagePath;

  final String animalName;
}
