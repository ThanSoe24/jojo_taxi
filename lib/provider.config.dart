import 'package:flutter/cupertino.dart';
import 'package:jojo_taxi/domain/repository/auth_repository.dart';
import 'package:jojo_taxi/domain/repository/general_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider.value(
      value: AuthRepository(),
    ),
    ChangeNotifierProvider.value(value: GeneralRepository())

  ];
}
