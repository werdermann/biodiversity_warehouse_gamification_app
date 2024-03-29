/// Species represents the kind of animal that the animal is.
enum Species {
  notSpecified(animalName: 'ANIMALS.NOT_SPECIFIED'),
  squirrel(animalName: 'ANIMALS.SQUIRREL'),
  rabbit(animalName: 'ANIMALS.RABBIT'),
  mole(animalName: 'ANIMALS.MOLE'),
  porpoise(animalName: 'ANIMALS.PORPOISE'),
  boar(animalName: 'ANIMALS.BOAR'),
  otter(animalName: 'ANIMALS.OTTER'),
  racoon(animalName: 'ANIMALS.RACOON'),
  beaver(animalName: 'ANIMALS.BEAVER'),
  wildCat(animalName: 'ANIMALS.WILD_CAT'),
  bat(animalName: 'ANIMALS.BAT'),
  rat(animalName: 'ANIMALS.RAT'),
  mink(animalName: 'ANIMALS.MINK'),
  blowFish(animalName: 'ANIMALS.BLOW_FISH'),
  ray(animalName: 'ANIMALS.RAY'),
  tigerShark(animalName: 'ANIMALS.TIGER_SHARK'),
  hammerHeadShark(animalName: 'ANIMALS.HAMMERHEAD_SHARK'),
  wolf(animalName: 'ANIMALS.WOLF'),
  dolphin(animalName: 'ANIMALS.DOLPHIN'),
  polarBear(animalName: 'ANIMALS.POLAR_BEAR'),
  hyena(animalName: 'ANIMALS.HYENA'),
  redFox(animalName: 'ANIMALS.RED_FOX'),
  badger(animalName: 'ANIMALS.BADGER'),
  elephant(animalName: 'ANIMALS.ELEPHANT'),
  hedgehog(animalName: 'ANIMALS.HEDGEHOG'),
  lion(animalName: 'ANIMALS.LION'),
  tiger(animalName: 'ANIMALS.TIGER'),
  giraffe(animalName: 'ANIMALS.GIRAFFE'),
  bunny(animalName: 'ANIMALS.BUNNY'),
  eurasianBluTit(animalName: 'ANIMALS.EURASIAN_BLU_TIT'),
  commonBlackBird(animalName: 'ANIMALS.COMMON_BLACKBIRD'),
  eurasianMagpie(animalName: 'ANIMALS.EURASIAN_MAGPIE'),
  panda(animalName: 'ANIMALS.PANDA'),
  cheetah(animalName: 'ANIMALS.CHEETAH'),
  hippopotamus(animalName: 'ANIMALS.HIPPOPOTAMUS'),
  rhinoceros(animalName: 'ANIMALS.RHINOCEROS'),
  chimpanzee(animalName: 'ANIMALS.CHIMPANZEE'),
  gorilla(animalName: 'ANIMALS.GORILLA'),
  baboon(animalName: 'ANIMALS.BABOON'),
  orangutan(animalName: 'ANIMALS.ORANGUTAN'),
  kingPenguin(animalName: 'ANIMALS.KING_PENGUIN'),
  orangeClownfish(animalName: 'ANIMALS.ORANGE_CLOWNFISH'),
  compassJellyfish(animalName: 'ANIMALS.COMPASS_JELLYFISH'),
  yellowLegGull(animalName: 'ANIMALS.YELLOW_LEGGED_GULL'),
  walrus(animalName: 'ANIMALS.WALRUS'),
  harborSeal(animalName: 'ANIMALS.HARBOR_SEAL'),
  roeDeer(animalName: 'ANIMALS.ROE_DEAR'),
  brownBear(animalName: 'ANIMALS.BROWN_BEAR'),
  goldenEagle(animalName: 'ANIMALS.GOLDEN_EAGLE'),
  blueBelliedParrot(animalName: 'ANIMALS.BLUE_BELLIED_PARROT'),
  hummingbird(animalName: 'ANIMALS.HUMMINGBIRD'),
  houseSparrow(animalName: 'ANIMALS.HOUSE_SPARROW'),
  trumpeterSwan(animalName: 'ANIMALS.TRUMPETER_SWAN'),
  greylagGoose(animalName: 'ANIMALS.GREYLAG_GOOSE'),
  frog(animalName: 'ANIMALS.GREEN_FROG'),
  crocodile(animalName: 'ANIMALS.NILE_CROCODILE'),
  easternGreyKangaroo(animalName: 'ANIMALS.EASTERN_GREY_KANGAROO'),
  littleSpottedKiwi(animalName: 'ANIMALS.LITTLE_SPOTTED_KIWI'),
  koala(animalName: 'ANIMALS.KOALA'),
  mountainZebra(animalName: 'ANIMALS.MOUNTAIN_ZEBRA'),
  horse(animalName: 'ANIMALS.HORSE'),
  mallard(animalName: 'ANIMALS.MALLARD'),
  dog(animalName: 'ANIMALS.DOG'),
  stork(animalName: 'ANIMALS.WHITE_STORK'),
  crab(animalName: 'ANIMALS.FIDDLER_CRAB'),
  moose(animalName: 'ANIMALS.MOOSE');

  const Species({
    required this.animalName,
  });

  final String animalName;
}
