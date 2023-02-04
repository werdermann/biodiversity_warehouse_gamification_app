import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/common/empty_resource.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';

class FinishOnBoardingUseCase {
  FinishOnBoardingUseCase({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  final LocalStorageRepository _localStorageRepository;

  Stream<EmptyResource> execute() async* {
    yield const EmptyResource.loading();

    try {
      print("LETS GO!");

      print("FINISH ON BOARDING!");

      await _localStorageRepository.storeBool(
        value: true,
        key: Constants.hasOnBoardingSeenKey,
      );

      _localStorageRepository.updateHasOnBoardingSeen(hasOnBoardingSeen: true);

      yield const EmptyResource.success();
    } catch (_) {
      yield const EmptyResource.error('ERROR.GENERAL');
    }
  }
}
