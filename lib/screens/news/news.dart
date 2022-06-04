import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/news.dart';

class NewsPage extends StatefulWidget {
  final News news;

  const NewsPage({Key? key, required this.news}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
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
            CachedNetworkImage(
              imageUrl: widget.news.image,
              imageBuilder: (context, imageProvider) => Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
