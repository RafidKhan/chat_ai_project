import 'package:chat_on/global/controllers/state/attempt_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constant/constant_key.dart';
import '../../data_provider/pref_helper.dart';

final attemptController = StateNotifierProvider.autoDispose<AttemptController, AttemptState>(
        (ref) => AttemptController());

class AttemptController extends StateNotifier<AttemptState> {

  AttemptController()
      : super(
     AttemptState(
      availableToken: 0,
    ),
  );


  void getAvailableToken() async{
   final limit =  await PrefHelper.getInt(AppConstant.AVAILABLE_TOKEN.key);
   state = state.copyWith(availableToken: limit);
  }

  void reduceToken(int index) {
    if(state.availableToken! > 0){
      state = state.copyWith(availableToken: state.availableToken! - 1);
    }
  }
}