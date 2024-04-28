import 'package:assesment_project/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constant/string_constants.dart';

/*
void main() {
  runApp(
      const ProviderScope(
          child: MyApp()
      )
  );
}
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      theme: ref.watch(theme),
      darkTheme: ref.watch(darkTheme),
      themeMode: ref.watch(themeMode),
      onGenerateTitle: (BuildContext context) => StringConstants.appName,
    );
  }
}
*/

//final themeProvider = Provider<ThemeData>((ref) => ThemeData.light());

void main() {
  runApp(
      const ProviderScope(
        child: MyApp(),

    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return
    MaterialApp.router(
            routerConfig: ref.watch(routerProvider),
            debugShowCheckedModeBanner: false,
            restorationScopeId: 'app',
        /*    theme: ref.watch(theme),
            darkTheme: ref.watch(darkTheme),
            themeMode: ref.watch(themeMode),*/
            onGenerateTitle: (BuildContext context) => StringConstants.appName
      );
  }
}