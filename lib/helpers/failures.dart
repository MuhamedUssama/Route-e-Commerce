class Failures {
  String? errorMessage;
  Failures({required this.errorMessage});
}

class ServerExeption extends Failures {
  ServerExeption({required super.errorMessage});
}

class NetworkExeption extends Failures {
  NetworkExeption({required super.errorMessage});
}
