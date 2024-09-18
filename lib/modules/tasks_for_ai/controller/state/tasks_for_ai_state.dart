import 'package:flutter/material.dart';

import '../../../chats/model/ai_prompt_model.dart';
import '../../model/tasks_for_ai_ui_model.dart';

class TasksForAiState {
  final int selectedCategoryIndex;
  final ScrollController scrollController;
  final List<PromptData> allPrompts;
  final List<PromptData> favouritePrompts;
  final bool isLoadingPrompts;
  final bool isLoadingFavouritePrompts;
  final List<TasksForAiUiModel> categories;
  final bool isLoadingCategories;

  const TasksForAiState({
    required this.selectedCategoryIndex,
    required this.scrollController,
    required this.allPrompts,
    required this.favouritePrompts,
    required this.isLoadingPrompts,
    required this.isLoadingFavouritePrompts,
    required this.categories,
    required this.isLoadingCategories,
  });

  TasksForAiState copyWith({
    int? selectedCategoryIndex,
    List<PromptData>? allPrompts,
    List<PromptData>? favouritePrompts,
    bool? isLoadingPrompts,
    bool? isLoadingFavouritePrompts,
    List<TasksForAiUiModel>? categories,
    bool? isLoadingCategories,
  }) {
    return TasksForAiState(
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      scrollController: scrollController,
      allPrompts: allPrompts ?? this.allPrompts,
      favouritePrompts: favouritePrompts ?? this.favouritePrompts,
      isLoadingPrompts: isLoadingPrompts ?? this.isLoadingPrompts,
      isLoadingFavouritePrompts: isLoadingFavouritePrompts ?? this.isLoadingFavouritePrompts,
      categories: categories ?? this.categories,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
    );
  }
}
