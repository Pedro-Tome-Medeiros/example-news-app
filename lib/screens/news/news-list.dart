import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/models/news.dart';
import 'package:news/screens/news/news.dart';

class NewsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsListPageSate();
}

class _NewsListPageSate extends State<NewsListPage> {
  late List<News> _newsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newsList = [];
    _loadNews();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: const Text('News')),
        body: ListView.builder(
            itemCount: _newsList.length,
            itemBuilder: (context, index) {
              final item = _newsList[index];
              return Card(
                child: ListTile(
                  title: Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      Text(item.text,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 5),
                      Text(item.date, style: const TextStyle(fontSize: 12))
                    ],
                  ),
                  leading: CachedNetworkImage(
                    imageUrl: item.image,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 100.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsPage(news: item)));
                  },
                ),
              );
            }));
  }

  Future<void> _loadNews() async {
    final jsonText = await rootBundle.loadString('assets/data/news.json');
    setState(() {
      _newsList =
          (json.decode(jsonText) as List).map((e) => News.fromJson(e)).toList();
    });
  }
}
