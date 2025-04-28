import 'package:flutter/material.dart';
import 'package:news_app/pages/widgets/trending_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending News",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text("See All", style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            SizedBox(height: 20),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TrendingCard(
                    imageUrl:
                        '"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ4EghSnJSFPI0IiFRHVz7XitNCKJBuLmclziJSNPbfTzummh9Qn6Pol06M-4c6C7W8CVsKQ&s"',
                    tag: '',
                    time: '',
                    title: '',
                    author: '',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "News for you",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text("See All", style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
