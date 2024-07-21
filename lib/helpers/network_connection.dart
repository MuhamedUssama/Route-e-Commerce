import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@singleton
class NewtworkConnections {
  Future<bool> isConnected() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }
}
