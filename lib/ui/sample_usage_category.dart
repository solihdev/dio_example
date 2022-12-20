import 'package:dio_example/view_models/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SampleUsageCategory extends StatefulWidget {
  const SampleUsageCategory({Key? key}) : super(key: key);

  @override
  State<SampleUsageCategory> createState() => _SampleUsageCategoryState();
}

class _SampleUsageCategoryState extends State<SampleUsageCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Usage 2"),
      ),
      body: Consumer<CategoryViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.categoryModel== null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("No data Yet"),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CategoryViewModel>().fetchCategory();
                    },
                    child: const Text("Get Data")),
              ],
            );
          }
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: viewModel.categoryModel!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 150,
                              height: 180,
                              child: Image.network(
                                viewModel.categoryModel![index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    viewModel.categoryModel![index].name,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text("Created at - ${viewModel.categoryModel![index].createdAt.toString()}",style: const TextStyle(
                                      fontSize: 20
                                  ),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
