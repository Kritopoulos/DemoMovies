import 'package:loadmore/loadmore.dart';

class ConstMethods {

  static String loadMoreWordings(LoadMoreStatus status) {
    String text;
    switch (status) {
      case LoadMoreStatus.fail:
        text = "Loading failed";
        break;
      case LoadMoreStatus.idle:
        text = "load more";
        break;
      case LoadMoreStatus.loading:
        text = "loading...";
        break;
      case LoadMoreStatus.nomore:
        text = "";
        break;
      default:
        text = "";
    }
    return text;
  }
}
