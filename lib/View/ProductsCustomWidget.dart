
import 'package:elevate_task/View/reusable/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ViewModel/productViewModel/ProductViewModel.dart';

class ProductsCustomWidget extends StatelessWidget {

  static String routeName = "ProductsView";
  const ProductsCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body:  BlocProvider(

        create: (context) =>ProductViewModel()..getProducts() ,
        child: BlocBuilder<ProductViewModel,ProductStates>(
            builder: (context,state){
              if(state is ProductSuccessState){
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                        childAspectRatio: 0.5,
                      crossAxisSpacing: 17,
                        mainAxisSpacing: 17
                    ),
                   itemBuilder: (context, index) => ProductCard(product: state.products[index]),
                    itemCount: state.products.length,

                )
                  );
              }
              if(state is ProductErrorState){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Something went wrong: ${state.errorMessage}",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ProductViewModel>(context).getProducts();
                        },
                        child: Text("Retry"),
                      )
                    ],
                  ),
                );

              }
              return Center(child: CircularProgressIndicator(),);
            }
        ),
      ),
    );


  }
}
