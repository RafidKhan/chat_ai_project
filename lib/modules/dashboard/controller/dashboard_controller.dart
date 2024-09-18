import 'package:chat_on/modules/dashboard/controller/state/dashboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/dashboard_interface.dart';
import '../repository/dashboard_repository.dart';

final dashboardController =
    StateNotifierProvider.autoDispose<DashboardController, DashboardState>(
        (ref) => DashboardController());

class DashboardController extends StateNotifier<DashboardState> {
  final IDashboardRepository _dashboardRepository = DashboardRepository();

  DashboardController()
      : super(
          const DashboardState(
            selectedIndex: 0,
          ),
        );

  void setIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
