import 'package:dio_example/data/api_service/api_service.dart';

import '../data/models/product_model.dart';

class ProductRepository{

  ProductRepository({
    required this.apiService,
});

  ApiService apiService;
  Future<List<ProductModel?>?>getAllProducts()=> apiService.getAllProducts();


}