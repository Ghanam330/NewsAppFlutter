abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}


class NewsAppModeChange extends NewsStates {}



class NewsGetBusinessSuccessState extends NewsStates {}
class NewsBusinessLoadingState extends NewsStates {}
class NewsGetBusinessErrorState extends NewsStates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}



class NewsGetSportsSuccessState extends NewsStates {}
class NewsSportsLoadingState extends NewsStates {}
class NewsGetSportsErrorState extends NewsStates {
  final String error;

  NewsGetSportsErrorState(this.error);
}


class NewsGetScienceSuccessState extends NewsStates {}
class NewsScienceLoadingState extends NewsStates {}
class NewsGetScienceErrorState extends NewsStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

