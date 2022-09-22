import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkStatus {
  late final connectivity = Connectivity();

  Future<ConnectivityResult> get status => connectivity.checkConnectivity();
  /* retorna el estado de conexion */

  Stream<ConnectivityResult> get statusStream =>
      connectivity.onConnectivityChanged;
  /* retorna el estado de conexion como stream */
}
