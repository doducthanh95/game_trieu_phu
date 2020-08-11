import 'package:kiwi/kiwi.dart';
import 'injector.g.dart';

abstract class Injector {
  static Container _container;

  static void setup() {
    _container = Container();
    InjectorSetUp().config(_container);
  }

  // ignore: type_annotate_public_apis
  static final resolve = _container.resolve;

  void config(Container container) {
    configInjector(container);
  }

  void configInjector(Container container);
}
