import 'package:get_it/get_it.dart';
import 'package:martinpulgarapp/service/api_service.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  getIt.registerSingleton(ApiService());
}
