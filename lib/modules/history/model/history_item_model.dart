

class HistoryItemModel {
  final String title;
  final String dateTime;
  final String? promptId;
  final String? promptResponse;


  const HistoryItemModel({
    required this.title,
    required this.dateTime,
    this.promptId,
    this.promptResponse,
  });
}
