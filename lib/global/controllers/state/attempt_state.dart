class AttemptState{
  int? availableToken;
  AttemptState({this.availableToken});

  AttemptState copyWith({
    int? availableToken}){
    return AttemptState(
        availableToken : availableToken ?? this.availableToken
    );
  }
}