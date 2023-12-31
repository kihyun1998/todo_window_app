import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/intl_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';
import 'package:todo_window_app/util/route_path.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          MaterialApp(
        debugShowCheckedModeBanner: false, // 화면에 디버그 줄 안나오게 하기

        /// local 설정 for ios
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: ref.watch(intlProvider).locale,

        /// theme 설정
        theme: ref.themeData,

        // 초기 페이지 설정
        initialRoute: RoutePath.home,
        // onGenerateRoute 설정
        onGenerateRoute: RoutePath.onGenerateRoute,
      ),
    );
  }
}
