
import 'package:dio/dio.dart';
import 'package:elevate_task/Model/Product.dart';

 class ApiManager{





   static Future<List<Product>> getAllProducts() async {
     final dio = Dio();

     try {
       final response = await dio.get('https://fakestoreapi.com/products');

       List<Product> products = (response.data as List)
           .map((productJson) => Product.fromJson(productJson))
           .toList();

       return products;
     } catch (err) {
       print('Error fetching products: $err');
       return [];
     }
   }


}