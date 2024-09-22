import 'package:flutter/material.dart';

import '../model/get_all_history_reponse.dart';

@immutable
abstract class IHistoryRepository {
  Future<void> getAllHistory({
    required Function(GetAllHistoryResponse response) onSuccess,
 });
}




