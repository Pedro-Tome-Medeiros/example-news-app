import 'package:eprosec/models/news.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  News news;

  NewsPage({Key? key, required this.news}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.news.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.news.image)
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.news.title,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(
                    widget.news.date,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text(widget.news.text, style: const TextStyle(height: 1.5))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
