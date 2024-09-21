import 'package:chat_on/modules/history/controller/state/history_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/get_all_history_reponse.dart';
import '../repository/history_interface.dart';
import '../repository/history_repository.dart';

final historyController =
StateNotifierProvider<HistoryController,HistoryState>(
        (ref) => HistoryController());

class HistoryController  extends StateNotifier<HistoryState>{
  final IHistoryRepository _historyRepository = HistoryRepository();

  HistoryController() : super(HistoryState(isLoading: true,getAllHistoryResponse: GetAllHistoryResponse()));

   Future<void> getAllHistory() async{
       state = state.copyWith(isLoading: true);
       await _historyRepository.getAllHistory(onSuccess: (onSuccess){
       state = state.copyWith(getAllHistoryResponse: onSuccess);
    });
     state = state.copyWith(isLoading: false);
   }
  }
