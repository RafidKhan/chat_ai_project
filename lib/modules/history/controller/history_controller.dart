import 'package:chat_on/modules/history/controller/state/history_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/get_all_history_reponse.dart';
import '../repository/history_interface.dart';
import '../repository/history_repository.dart';

final historyController =
StateNotifierProvider<HistoryController, HistoryState>(
        (ref) => HistoryController());

class HistoryController  extends StateNotifier<HistoryState>{
  final IHistoryRepository _historyRepository = HistoryRepository();

  HistoryController() : super(HistoryState(isLoading: true,getAllHistoryResponse: GetAllHistoryResponse()));

   Future<void> getAllHistory() async{
       state = state.copyWith(isLoading: true);
       await _historyRepository.getAllHistory(onSuccess: (response){
         state = state.copyWith(getAllHistoryResponse: response);
       });
     state = state.copyWith(isLoading: false);
   }

   Future<void> deleteHistoryById(String historyId,int index) async{
     await _historyRepository.deleteHistoryById(historyId: historyId, onSuccess: (success){
       if(success.status == 200 || success.status == 201){
         GetAllHistoryResponse response = state.getAllHistoryResponse!;
         List<History> allHistory = state.getAllHistoryResponse!.data!;
         allHistory.removeAt(index);
         response.copyWith(status: 200,message: "success",data: allHistory);
         state = state.copyWith(getAllHistoryResponse: response);
       }
     });
   }
}
