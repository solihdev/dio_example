import 'package:dio_example/data/models/product_model.dart';
import 'package:dio_example/data/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel({required this.productRepository});

  ProductModel? productModel;

  ProductRepository productRepository;

  fetchProduct() async {
    productModel = (await productRepository.getAllProducts()) as ProductModel?;
    notifyListeners();
  }
}
