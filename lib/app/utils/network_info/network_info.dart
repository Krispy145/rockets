import 'package:internet_connection_checker/internet_connection_checker.dart';

///Abstract class responsible for defining what methods need to be implemented
///when checking internet connectivity.
abstract class NetworkInfo {
  Future<bool> isConnected();
}

///Implementation class responsible for checking internet connectivity.
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> isConnected() => connectionChecker.hasConnection;
}
