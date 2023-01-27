/*
class CheckTokenUseCase {
  CheckTokenUseCase({
    required LocalStorageRepository localStorageRepository,
  }) : _localRepository = localStorageRepository;

  final LocalStorageRepository _localStorageRepository;

  Stream<Resource<String>> execute() async* {
    yield const Resource.loading();

    final token = _localStorageRepository.getObject<String>(
      key: Constants.accessTokenStorageKey,
    );

    if (token != null) {
      final result = token;

      yield Resource.success(token);
    }


  }
}

 */
