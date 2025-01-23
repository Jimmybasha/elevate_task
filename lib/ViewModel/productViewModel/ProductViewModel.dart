import 'package:elevate_task/remote/ApiManager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/Product.dart';

class ProductViewModel extends Cubit<ProductStates>{




  ProductViewModel():super(ProductLoadingState());

  getProducts()async{
    try{
    emit(ProductLoadingState());
    var response = await ApiManager.getAllProducts();

    if(response==null){
      emit(ProductErrorState("Data isn't Found"));
    }else{
      emit(ProductSuccessState(response));
    }
    }catch(error){
      emit(ProductErrorState(error.toString()));
    }
  }
}



abstract class ProductStates{}


class ProductLoadingState extends ProductStates{}

class ProductErrorState extends ProductStates{

  String errorMessage;
  ProductErrorState(this.errorMessage);

}

class ProductSuccessState extends ProductStates{

  List<Product> products;

  ProductSuccessState(this.products);



}