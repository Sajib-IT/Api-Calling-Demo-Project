import 'package:dummy_api_call/src/api_show_page.dart';
import 'package:dummy_api_call/src/movies_api_show_page.dart';
import 'package:flutter/material.dart';

class CommonViewPage extends StatelessWidget {
  const CommonViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ApiShowPage())),
              child: const Text("Product Details")),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => MoviesApiShowPage())),
              child: const Text("Movies Details")),
        ],
      )),
    );
  }
}
