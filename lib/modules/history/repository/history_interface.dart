import 'package:flutter/material.dart';

@immutable
abstract class IHistoryRepository {
  Future getAllHistory({
    required Function(String response) onSuccess,
 });
}




