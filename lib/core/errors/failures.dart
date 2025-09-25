abstract class Failure {
  final String message;
  Failure(this.message);
}
class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class OfflineFailure extends Failure {
  OfflineFailure(super.message);
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.message);
}
