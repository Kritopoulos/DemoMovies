import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_project/routes/route_generator.dart';
import 'package:movies_project/routes/routes.dart';
import 'package:movies_project/setup_locator.dart';
import 'package:movies_project/ui/screens/movies_screen.dart';
import 'package:movies_project/utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(context),
        onGenerateRoute: RouteGenerator.geneRateRoute,
        initialRoute: Routes.moviesScreen,

    );
  }
}
