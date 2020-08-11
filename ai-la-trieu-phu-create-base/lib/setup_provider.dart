import 'package:ai_la_trieu_phu/common/di/injector.dart';
import 'package:ai_la_trieu_phu/feature/services/question_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  // ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Injector.resolve<QuestionService>()),
];

// List<SingleChildWidget> uiConsumableProviders = [
//   StreamProvider<User>(
//     create: (context) =>
//         Provider.of<AuthService>(context, listen: false).userStream,
//   ),

// ];
