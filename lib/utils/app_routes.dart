import 'package:chat_on/modules/auth/registration/views/registration_screen.dart';
import 'package:chat_on/modules/chat_thread/model/chat_thread_nav_model.dart';
import '../modules/auth/sign_in/views/sign_in_screen.dart';
import 'package:flutter/material.dart';
import '../modules/chat_thread/views/chat_thread_screen.dart';
import '../modules/chat_thread/views/components/image_full_screen_view.dart';
import '../modules/chats/views/chats_screen.dart';
import '../modules/dashboard/views/dashboard_screen.dart';
import '../modules/get_pro_access/views/get_pro_access_screen.dart';
import '../modules/history/views/history_screen.dart';
import '../modules/settings/views/settings_screen.dart';
import '../modules/splash/views/splash_screen.dart';
import '../modules/tasks_for_ai/views/tasks_for_ai_screen.dart';

enum AppRoutes {
  splash,
  signIn,
  registration,
  getProAccess,
  chatThread,
  settings,
  history,
  tasksForAi,
  chats,
  dashboard
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.signIn:
        return const SignInScreen();
      case AppRoutes.registration:
        return const RegistrationScreen();
      case AppRoutes.getProAccess:
        return const GetProAccessScreen();
      case AppRoutes.chatThread:
        return ChatThreadScreen(
          model: arguments as ChatThreadNavModel,
        );
      case AppRoutes.settings:
        return const SettingsScreen();
      case AppRoutes.history:
        return const HistoryScreen();

      case AppRoutes.tasksForAi:
        return const TasksForAiScreen();
      case AppRoutes.chats:
        return const ChatsScreen();
      case AppRoutes.dashboard:
        return const DashboardScreen();
      case AppRoutes.splash:
        return const SplashScreen();
    }
  }
}
