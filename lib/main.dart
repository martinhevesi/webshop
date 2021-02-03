import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:webshop/db/profile_repository.dart';
import 'package:webshop/db/sql.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/navigation/product_route_information_parser.dart';
import 'package:webshop/navigation/product_router_delegate.dart';
import 'package:provider/provider.dart';
import 'package:webshop/models/cart.dart';
import 'package:webshop/screens/lang.dart';
import 'package:webshop/screens/localeModel.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  final camera = cameras.length > 0 ? cameras.first : null;

  final sql = Sql();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        Provider(
          create: (_) => ProfileRepository(sql: sql),
        ),
        Provider.value(value: camera),

      ],
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ProductRouterDelegate _routerDelegate;
  ProductRouteInformationParser _routeInformationParser;

  @override
  void initState() {
    super.initState();
    _routeInformationParser = ProductRouteInformationParser();
    _routerDelegate = ProductRouterDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new LocaleModel(),
        child: Consumer<LocaleModel>(
          builder: (context, provider, child) =>  MaterialApp.router(
            locale: Provider.of<LocaleModel>(context).locale,
            theme: ThemeData(
              primaryColor: Colors.deepPurple,
            ),
            routeInformationParser: _routeInformationParser,
            routerDelegate: _routerDelegate,

            localizationsDelegates: [
              WebshopLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],

            supportedLocales: [
              const Locale('en', ''),
              const Locale('hu', ''),
            ],
          ),
        )
    );

  }
}
