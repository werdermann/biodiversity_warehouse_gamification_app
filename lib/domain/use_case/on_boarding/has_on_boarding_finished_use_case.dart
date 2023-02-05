import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/common/resource.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';

/// Use case for checking if the user has finished the on boarding process.
class HasOnBoardingFinishedUseCase {
  /// Constructor.
  HasOnBoardingFinishedUseCase({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  final LocalStorageRepository _localStorageRepository;

  Stream<Resource<bool>> execute() async* {
    yield const Resource.loading();

    try {
      final hasOnBoardingFinished = _localStorageRepository.getObject<bool>(
            key: Constants.hasOnBoardingSeenKey,
          ) ??
          false;
      yield Resource.success(hasOnBoardingFinished);
    } catch (_) {
      yield const Resource.error('ERROR.GENERAL');
    }
  }
}
