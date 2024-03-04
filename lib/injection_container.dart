import 'package:four_calculator/app/presentation/home/home_notifier.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initDependencies(){

  //provider
  sl.registerFactory<HomeNotifier>(() => HomeNotifier());

}