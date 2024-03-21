
import 'package:evento/bootstrap.dart';

import 'package:evento/presentation/presentation.dart';

import 'package:url_strategy/url_strategy.dart';

void main() async{
  setPathUrlStrategy();
  bootstrap(() =>  App());
}
