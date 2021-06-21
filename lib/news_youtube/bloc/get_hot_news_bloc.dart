import 'package:newsappudemycourse/news_youtube/model/article_response.dart';
import 'package:newsappudemycourse/news_youtube/respository/repository.dart';
import 'package:rxdart/rxdart.dart';


class GetHotNewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
  BehaviorSubject<ArticleResponse>();

  getHotNews() async {
    ArticleResponse response = await _repository.getHotNews();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;

}
final getHotNewsBloc = GetHotNewsBloc();