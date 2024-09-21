
import 'package:flutter/cupertino.dart';

import '../../model/get_all_history_reponse.dart';

@immutable
class HistoryState{
  final bool? isLoading;
  final GetAllHistoryResponse? getAllHistoryResponse;

  const HistoryState({this.isLoading,
    this.getAllHistoryResponse});

  HistoryState copyWith({bool? isLoading,
    GetAllHistoryResponse? getAllHistoryResponse,}){
   return HistoryState(
     isLoading: isLoading,
     getAllHistoryResponse: getAllHistoryResponse ?? this.getAllHistoryResponse
   );
  }
}