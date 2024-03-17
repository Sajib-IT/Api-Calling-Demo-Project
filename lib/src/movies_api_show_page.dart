import 'package:dummy_api_call/services/api_service.dart';
import 'package:dummy_api_call/widgets/dummy_api_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'movies_api_model.dart';

class MoviesApiShowPage extends StatefulWidget {
  const MoviesApiShowPage({super.key});

  @override
  State<MoviesApiShowPage> createState() => _MoviesApiShowPageState();
}

class _MoviesApiShowPageState extends State<MoviesApiShowPage> {
  ApiService apiService = ApiService();
  String url = "https://dummyapi.online/api/movies";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies Details"),
      ),
      body: FutureBuilder<List<MoviesApiModel>>(
          future: apiService.apiCallForMovies(
              url: "https://dummyapi.online/api/movies"),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black38, strokeAlign: 5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Text(
                                      snapshot.data![index].movie.toString(),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  ),
                                  Flexible(
                                      flex: 1,
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.orangeAccent,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                    children: [
                                                  TextSpan(
                                                      text:
                                                          "${snapshot.data![index].rating}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16)),
                                                  const TextSpan(
                                                      text: '/',
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                  const TextSpan(
                                                      text: "10",
                                                      style: TextStyle(
                                                          fontSize: 14))
                                                ])),
                                          ]))
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              InkWell(
                                onTap: (){
                                  launchUrlString(snapshot.data![index].imdbUrl!,
                                    mode: LaunchMode.inAppWebView,
                                  );
                                },
                                child: RichText(
                                    text: TextSpan(
                                        style: const TextStyle(color: Colors.black),
                                        children: [
                                      const TextSpan(
                                          text: "Movie Link : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      TextSpan(
                                          text: snapshot.data![index].imdbUrl,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing: 0.2)),
                                    ])),
                              ),
                            ],
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 32,
                      );
                    },
                  )
                : const DummyApiShimmer();
          }),
    );
  }
}
