import 'package:food/models/category.dart';
import 'package:food/models/product.dart';
import 'package:food/service/api_service.dart';

class DataService {
  static final DataService _instance = DataService._internal();

  factory DataService() {
    return _instance;
  }

  DataService._internal();

  List<Categories>? readyToEatCategories;
  List<Categories>? alaCarteCategories;
  List<Product>? readyToEatProducts;
  List<Product>? alaCarteProducts;
  List<Product>? product;
  
  int? id;  

  void setId(int newId) {
    id = newId;
  }

  Future<void> loadApiData() async {
    readyToEatCategories = await ApiService().fetchCategories("ready_to_eat");
    alaCarteCategories = await ApiService().fetchCategories("a_la_carte");
    readyToEatProducts = await ApiService().fetchProducts("ready_to_eat");
    alaCarteProducts = await ApiService().fetchProducts("a_la_carte");
    product = await ApiService().fetchAllProducts();
  }
}
