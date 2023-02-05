import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/common/empty_resource.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';

/// Use case for finishing the on boarding process. Stores the information in
/// the local storage.
class FinishOnBoardingUseCase {
  FinishOnBoardingUseCase({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  final LocalStorageRepository _localStorageRepository;

  Stream<EmptyResource> execute() async* {
    yield const EmptyResource.loading();

    try {
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
