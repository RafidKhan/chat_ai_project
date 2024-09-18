import 'package:chat_on/modules/tasks_for_ai/controller/state/tasks_for_ai_state.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../utils/navigation.dart';
import '../../../utils/styles/k_assets.dart';
import '../../chats/model/ai_prompt_model.dart';
import '../model/tasks_for_ai_ui_model.dart';
import '../repository/tasks_for_ai_interface.dart';
import '../repository/tasks_for_ai_repository.dart';

final tasksForAiController =
StateNotifierProvider<TasksForAiController, TasksForAiState>(
        (ref) => TasksForAiController());

class TasksForAiController extends StateNotifier<TasksForAiState> {
  final ITasksForAiRepository _tasksforaiRepository = TasksForAiRepository();

  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
  ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
  ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
  ScrollOffsetListener.create();

  TasksForAiController()
      : super(
    TasksForAiState(
      selectedCategoryIndex: 1,
      scrollController: ScrollController(),
      isLoadingPrompts: false,
      isLoadingFavouritePrompts: false,
      allPrompts: [],
      favouritePrompts: [],
      categories: [],
      isLoadingCategories: false,
    ),
  );

  Future<void> callApis() async {
    await getPromptTags();
    await loadFavouritePrompts();
  }

  void setCategoryIndex(int index, {required bool isInitialCall}) {
    if (state.selectedCategoryIndex == index) {
      return;
    }
    state = state.copyWith(selectedCategoryIndex: index);

    if (!isInitialCall) {
      itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 2),
        curve: Curves.easeIn,
      );
    }

    scrollToTop();
  }

  void scrollToTop() {
    state.scrollController.animateTo(
      state.scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> loadTagWisePromptsPrompts({
    required String tagId,
  }) async {
    state = state.copyWith(isLoadingPrompts: true);
    await _tasksforaiRepository.getTagWiseAiPrompts(
      tagId: tagId,
      onSuccess: (response) {
        state = state.copyWith(allPrompts: response.data ?? []);
      },
    );
    validateFavouritePrompts();
    state = state.copyWith(isLoadingPrompts: false);
  }

  Future<void> loadFavouritePrompts() async {
    state = state.copyWith(
      isLoadingFavouritePrompts: true,
      favouritePrompts: [],
    );
    await _tasksforaiRepository.getFavouriteAiPrompts(
      onSuccess: (response) {
        state = state.copyWith(
            favouritePrompts: (response.payload ?? []).map((e) {
              return PromptData(
                id: e.promptId?.id,
                title: e.promptId?.title,
                subTitle: e.promptId?.subTitle,
                icon: e.promptId?.icon,
                isFavourite: true,
              );
            }).toList());
      },
    );
    validateFavouritePrompts();
    state = state.copyWith(isLoadingFavouritePrompts: false);
  }

  void validateFavouritePrompts() {
    final allPrompts = state.allPrompts;
    final List<String?> favouritePromptsIds =
    List<String?>.generate(state.favouritePrompts.length, (index) {
      return state.favouritePrompts[index].id;
    });

    allPrompts.forEach((e) {
      if (favouritePromptsIds.contains(e.id)) {
        e.isFavourite = true;
      }
    });
    state = state.copyWith(allPrompts: allPrompts);
  }

  Future<void> setFavouriteStatus(BuildContext context, {
    required PromptData prompt,
  }) async {
    ViewUtil.showLoader();
    await _tasksforaiRepository.setFavouritePrompt(
      promptId: prompt.id ?? "",
      onSuccess: (response) {
        'resp is:: ${response.message}'.log();
        Navigation.pop(context);
        ViewUtil.SSLSnackbar(response.message ?? "");
        final bool isFavourite = prompt.isFavourite ?? false;
        prompt.isFavourite = !isFavourite;
        loadFavouritePrompts();
      },
    );
  }

  Future<void> deleteFavouriteStatus(BuildContext context, {
    required PromptData prompt,
  }) async {
    ViewUtil.showLoader();
    await _tasksforaiRepository.deleteFavouritePrompt(
      promptId: prompt.id ?? "",
      onSuccess: (response) {
        Navigation.pop(context);
        ViewUtil.SSLSnackbar(response.message ?? "");
        final bool isFavourite = prompt.isFavourite ?? false;
        prompt.isFavourite = !isFavourite;
        loadFavouritePrompts();
      },
    );
  }


  Future<void> getPromptTags() async {
    state = state.copyWith(isLoadingCategories: true);
    await _tasksforaiRepository.getPromptTags(
        onSuccess: (response) {
          state = state.copyWith(
            categories: (response.data ?? []).map((e) {
              return TasksForAiUiModel(
                id: e.id,
                title: e.title ?? "",
                icon: e.icon??"",
              );
            }).toList(),
          );
        }
    );
    state = state.copyWith(isLoadingCategories: false);
  }
}
