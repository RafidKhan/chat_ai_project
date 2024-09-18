import 'package:chat_on/modules/history/controller/state/history_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/history_interface.dart';
import '../repository/history_repository.dart';

final historyController =
StateNotifierProvider<HistoryController,HistoryState>(
        (ref) => HistoryController());

class HistoryController  extends StateNotifier<HistoryState>{
  final IHistoryRepository _historyRepository = HistoryRepository();

  HistoryController() : super(const HistoryState(isLoading: false)){

   }

   Future<void> getAllHistory() async{
    await _historyRepository.getAllHistory(onSuccess: (onSuccess){
      print("my response ${onSuccess.toString()}");
    });
   }
  }
