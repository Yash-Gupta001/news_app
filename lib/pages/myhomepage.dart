import 'package:flutter/material.dart';

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
                Text(
                  "See All", 
                  style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDJ8fG5ld3xlbnwwfHx8fDE2OTY1NTQxNzE&ixlib=rb-4.0.3&q=80&w=1080",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "News Title",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
