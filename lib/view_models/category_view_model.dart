import 'package:dio_example/data/models/category_model.dart';
import 'package:dio_example/data/repository/category_repository.dart';
import 'package:flutter/cupertino.dart';

class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel({required this.categoryRepository});

  CategoryModel? categoryModel;

  CategoryRepository categoryRepository;

  fetchProduct() async {
    categoryModel = (await categoryRepository.getAllCategories()) as CategoryModel?;
    notifyListeners();
  }
}
