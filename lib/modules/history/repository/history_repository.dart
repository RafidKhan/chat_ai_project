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
}



