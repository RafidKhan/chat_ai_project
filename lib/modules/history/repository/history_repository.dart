import '../model/delete_history_reponse.dart';
import '../model/get_all_history_reponse.dart';
import 'history_api.dart';
import 'history_interface.dart';

class HistoryRepository implements IHistoryRepository {
  final HistoryApi _api = HistoryApi();

  @override
  Future<void> getAllHistory({required Function(GetAllHistoryResponse response) onSuccess})
  async{
    await _api.getAllHistory(response: (response){
      onSuccess(GetAllHistoryResponse.fromMap(response.data));
    });
  }

  @override
  Future<void> deleteHistoryById({required String historyId, required Function(DeleteHistoryResponse response) onSuccess}) async{
    await _api.deleteHistoryById(historyId: historyId, response: (response){
     onSuccess(DeleteHistoryResponse.fromMap(response.data));
    });
  }
}



