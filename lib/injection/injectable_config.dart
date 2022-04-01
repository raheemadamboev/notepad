
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable_config.config.dart';

@InjectableInit()
void configureDependencies() => $initGetIt(GetIt.instance);