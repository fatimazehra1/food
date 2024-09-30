import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food/models/product.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';
import 'package:food/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
Future<List<Product>?> getProductsFromSharedPreferences() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartJson = prefs.getString('cart');
      print('Retrieved Cart JSON: $cartJson');
 
    if (cartJson != null) {
      Map<String, dynamic> cartData = jsonDecode(cartJson);

      List<dynamic> productList = cartData['products'];
      // Map each product in the list to your Product model
      List<Product> products = productList.map((productMap) {
        return Product(
          id: productMap['productID'],
          barCode: productMap['productID'],
          item: productMap['BarCode'],
          itemImage: productMap['BarCode'],
          rate: productMap['BarCode'], 
          salesRate: productMap['BarCode'],
          categoryCode: productMap['BarCode'],
          isModifier: productMap['BarCode'],
          // isModifierGroup: productMap['BarCode'],
          itemDescription: productMap['BarCode'],
          itemType: productMap['BarCode'],
       
        );
      }).toList();
      //   return Product(
      //     id: productMap['productID'],
      //     barCode: productMap['BarCode'],
      //     item: productMap['Item'],
      //     itemImage: productMap['ItemImage'],
      //     rate: productMap['Rate'], 
      //     salesRate: productMap['SalesRate'],
      //     categoryCode: productMap['CategoryCode'],
      //     isModifier: productMap['IsModifier'],
      //     isModifierGroup: productMap['IsModifierGroup'],
      //     itemDescription: productMap['item_description'],
      //     itemType: productMap['item_type'],
      //     modifiers: productMap['modifiers'] != null && productMap['modifiers'].isNotEmpty
      //         ? (productMap['modifiers'] as Map<String, dynamic>).map((key, value) {
      //             return MapEntry(key, ModifierGroup.fromJson(value));
      //           })
      //         : null, // Handle empty modifiers
      //   );
      // }).toList();
      print('products $products');

      return products;
    }
    return null;
  } catch (error) {
    print("Error loading cart items: $error");
    return null;
  }
}

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: screenHeight * 0.05,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        primaryBackButton(),
                        SizedBox(width: screenWidth * 0.05),
                        WhiteText('Cart'),
                        SizedBox(width: screenWidth * 0.025),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'DONE',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: screenHeight * 0.018,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: FutureBuilder<List<Product>?>(
                    future: getProductsFromSharedPreferences(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error loading cart items'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No items in the cart'));
                      } else {
                        List<Product>? products = snapshot.data;
                        return ListView.builder(
                          itemCount: products!.length,
                          itemBuilder: (context, index) {  
                            Product product = products[index];
                            return Card(
                              child: ListTile(
                                leading: Image.network(product.itemImage),
                                title: Text(product.item),
                                subtitle: Text(
                                    'Price: ${product.salesRate.toString()}'),
                                // trailing: Text(
                                //     'Qty: ${product.quantity.toString()}'),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
