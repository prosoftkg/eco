abstract class Failure {}

class ServerError extends Failure {
  Object error;

  ServerError({required this.error});
}
