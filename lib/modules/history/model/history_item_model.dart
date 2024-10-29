

class HistoryItemModel {
  final String title;
  final String dateTime;
  final String? promptId;
  final String? promptResponse;
  final String? aiType;


  const HistoryItemModel({
    required this.title,
    required this.dateTime,
    this.promptId,
    this.promptResponse,
    this.aiType
  });
}
