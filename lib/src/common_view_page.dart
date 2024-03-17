import 'package:dummy_api_call/src/api_show_page.dart';
import 'package:dummy_api_call/src/movies_api_show_page.dart';
import 'package:flutter/material.dart';

class CommonViewPage extends StatelessWidget {
  const CommonViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ApiShowPage())),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                ),
                child: const Text(
                  "Product Details",
                  style: TextStyle(color: Colors.white,fontSize: 24),
                )),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => MoviesApiShowPage())),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                ),
                child: const Text(
                  "Movies Details",
                  style: TextStyle(color: Colors.white,fontSize: 25),
                )),
          ],
        ),
      ),
    );
  }
}
