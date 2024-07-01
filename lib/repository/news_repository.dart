import 'dart:convert';


import 'package:http/http.dart' as http;

import '../models/categories_new_model.dart';
import '../models/news_channel_headlines_model.dart';

class NewsRepository {


  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    String newsUrl =
        'https://newsapi.org/v2/everything?q=${category}&apiKey=dee3b9615da84d0f9a472e6efc7987b5';
    final response = await http.get(Uri.parse(newsUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return CategoriesNewsModel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }

  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(String newsChannel) async {
    String newsUrl = 'https://newsapi.org/v2/top-headlines?sources=${newsChannel}&apiKey=dee3b9615da84d0f9a472e6efc7987b5';
    print(newsUrl);
    final response = await http.get(Uri.parse(newsUrl));
    print(response.statusCode.toString());
    print(response);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }
}
