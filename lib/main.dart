import 'package:flutter/material.dart';
import 'package:hotstar/logic/accounts/user_account_bloc.dart';
import 'package:hotstar/logic/provider/user_image_provider.dart';
import 'package:hotstar/router/router_config.dart';
import 'package:hotstar/utils/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserAccountBloc(),
          ),
        ],
        child: ChangeNotifierProvider(
          create: (context) => AccountImageProvider(),
          child: MaterialApp.router(
            title: 'Hotstar',
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouterConfig.router,
            theme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.black,
              textTheme: TextTheme(
                bodyLarge: bodyLarge,
                bodyMedium: bodyMedium,
                bodySmall: bodySmall,
                titleMedium: titleMedium,
                titleSmall: titleSmall,
                headlineSmall: headLineSmall,
              ),
              fontFamily: 'SFProDisplay',
            ),
          ),
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:hotstar/presentation/widgets/home/stless_pro.dart';
// void main() {
// WidgetsFlutterBinding.ensureInitialized();
// runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const TestMood()
//     );
//   }
// }