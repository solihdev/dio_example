import 'package:dio/dio.dart';
import 'package:dio_example/data/api_service/api_client.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
class ApiService extends ApiClient{

  Future<List<ProductModel>> getAllProducts() async {
    try {
      Response response = await dio
          .get("${dio.options.baseUrl}/products");
      if (response.statusCode == 200) {
        var jsonData = ProductModel.fromJson(response.data);
        List<ProductModel> products = (jsonData as List?)
                ?.map((item) => ProductModel.fromJson(item))
                .toList() ??
            [];
        return products;
      }throw Exception();
    } catch (error) {
      print(error.toString());
    }
    return [];
  }

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      Response response = await dio
          .get("${dio.options.baseUrl}/categories");
      if (response.statusCode == 200) {
        return response.data.map((e) => CategoryModel.fromJson(e)).toList()??[];
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }
}
