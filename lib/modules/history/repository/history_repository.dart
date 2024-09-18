import 'history_api.dart';
import 'history_interface.dart';

class HistoryRepository implements IHistoryRepository {
  final HistoryApi _api = HistoryApi();
  @override
  Future getAllHistory({required Function(String response) onSuccess}) async{
    await _api.getAllHistory(onSuccess: (response){

    });
  }
}



