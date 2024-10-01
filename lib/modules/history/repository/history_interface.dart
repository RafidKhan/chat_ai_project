import 'package:flutter/material.dart';

import '../model/delete_history_reponse.dart';
import '../model/get_all_history_reponse.dart';

@immutable
abstract class IHistoryRepository {
  Future<void> getAllHistory({
    required Function(GetAllHistoryResponse response) onSuccess,
 });

  Future<void> deleteHistoryById({
    required String historyId,
    required Function(DeleteHistoryResponse response) onSuccess,
  });
}




