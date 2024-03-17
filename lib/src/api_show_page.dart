import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dummy_api_call/services/api_service.dart';
import 'package:dummy_api_call/src/dummy_api_model.dart';
import 'package:dummy_api_call/widgets/dummy_api_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ApiShowPage extends StatefulWidget {
  ApiShowPage({super.key});

  @override
  State<ApiShowPage> createState() => _ApiShowPageState();
}

class _ApiShowPageState extends State<ApiShowPage> {
  // var result;
  ApiService apiService = ApiService();
  @override
  void initState() {
    // apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: FutureBuilder(
          future: apiService.apiCall(url: "https://dummyjson.com/products"),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.separated(
                    itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black38, strokeAlign: 5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(2)),
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                  snapshot.data!.products![index].thumbnail!),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Text(
                                        snapshot
                                            .data!.products![index].title!,
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 17),
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // Spacer(),

                                    Flexible(
                                        child: Text(
                                      "\$ ${snapshot.data!.products![index].price}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                snapshot.data!.products![index].description!,
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent, fontSize: 18),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                    separatorBuilder: (ctx, ind) => const SizedBox(
                          height: 32,
                        ),
                    itemCount: snapshot.data!.products!.length)
                : const DummyApiShimmer(isProductApi: true,);
          }),
      // bottomNavigationBar: ElevatedButton(
      //   onPressed: () {
      //     // apiCall();
      //   },
      //   child: Text("api Call"),
      // ),
    );
  }
}

// Future<DummyApiModel> apiCall() async {
//   String url = "https://dummyjson.com/products";
//   Dio dio = Dio();
//   var res = await dio.get(url);
//   return DummyApiModel.fromJson(res.data);
//   // print("pro ${dummyApiModel.products![29].id}");
// }
