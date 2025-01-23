import 'dart:ffi';

import 'package:elevate_task/Model/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {


  Product product;

   ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {

          return  Container(

            padding: EdgeInsets.only(
              bottom: 1
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blue,
              )

            ),
            child: Column(
                  children: [
                    Column(



                      children: [
                        Stack(
                            alignment: Alignment.topRight,
                            children:[Image.network('${product.image}',
                              fit: BoxFit.fill,
                              height:200 ,
                              width: double.infinity,
                            ),
                              Spacer(),
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border),color: Color(0xFF004087),))
                            ]
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${product.title}',maxLines: 2,overflow:TextOverflow.ellipsis ,),
                              SizedBox(height:10,),
                              Text('${product.description}',maxLines: 2,overflow: TextOverflow.ellipsis,),
                              SizedBox(height:10,),
                              Text('EGP ${product.price}'),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Review'),
                                  SizedBox(width: 5,),
                                  Text('(${product.rating?.rate??0})'),
                                  IconButton(onPressed: (){}, icon:Icon(Icons.star,size: 25,color: Colors.yellow,)),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Color(0xFF004087),
                                        child: IconButton(onPressed: (){}, icon:Icon(Icons.add,size: 30,color: Colors.white,))
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
            ),
          );

  }
}