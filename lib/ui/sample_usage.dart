import 'package:dio_example/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SampleUsage extends StatefulWidget {
  const SampleUsage({Key? key}) : super(key: key);

  @override
  State<SampleUsage> createState() => _SampleUsageState();
}

class _SampleUsageState extends State<SampleUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Usage"),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context,viewModel,child){
          if(viewModel.productModel==null){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text("No data Yet"),),
                ElevatedButton(onPressed: () {
                  context.read<ProductViewModel>().fetchProduct();
                }, child: const Text("Get Data")),
              ],
            );
          }
          return Column(
            children: [
              Text(viewModel.productModel![0].id.toString()),
              Text(viewModel.productModel![0].name),
              Text(viewModel.productModel![0].price.toString()),
            ],
          );
        },
      ),
    );
  }
}
