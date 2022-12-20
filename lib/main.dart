import 'package:dio_example/data/api_service/api_service.dart';
import 'package:dio_example/repsotory/product_repository.dart';
import 'package:dio_example/ui/sample_usage.dart';
import 'package:dio_example/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductViewModel(
        productRepository: ProductRepository(apiService: ApiService()),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter dio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleUsage(),
    );
  }
}
