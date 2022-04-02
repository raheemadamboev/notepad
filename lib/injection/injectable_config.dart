import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable_config.config.dart';

final inject = GetIt.instance;

@injectableInit
void configureDependencies() => $initGetIt(inject);
