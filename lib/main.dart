import 'package:chat_on/constant/app_url.dart';
import 'package:chat_on/data_provider/pref_helper.dart';
import 'package:chat_on/utils/app_version.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/network_connection.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//localization
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'modules/splash/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  //Set Potraite Mode only
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(ProviderScope(child: MyApp()));
}

/// Make sure you always init shared pref first. It has token and token is need
/// to make API call
initServices() async {
  AppUrlExtention.setUrl(
    UrlLink.isDev,
  );
  await PrefHelper.init();
  await AppVersion.getVersion();
  await NetworkConnection.instance.InternetAvailable();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return ScreenUtilInit(
      //Change the height and Width based on design
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (ctx, child) {
        return MaterialApp(
          title: 'Chat iBot',
          navigatorKey: Navigation.key,
          debugShowCheckedModeBanner: false,
          //localization
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: (PrefHelper.getLanguage() == 1)
              ? const Locale('en', 'US')
              : const Locale('bn', 'BD'),
          theme: ThemeData(
            iconTheme: IconThemeData(
              color: KColor.white.color,
            ),
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: KColor.secondary.color,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(),
            primaryColor: KColor.gradient2.color,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme: ThemeData().colorScheme.copyWith(
                  secondary: KColor.secondary.color,
                ),
          ),
          builder: (context, widget) {
            return ScrollConfiguration(
              behavior: const ScrollBehaviorModified(),
              child: widget ?? const SizedBox(),
            );
          },
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
