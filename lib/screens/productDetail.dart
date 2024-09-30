import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/models/product.dart';
import 'package:food/screens/CartScreen.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';
import 'package:food/service/data_service.dart';
import 'package:food/theme.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  final int id;

  const ProductDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double basePrice = 0.0;
  double modifiedPrice = 0.0;
  double priceFromModifier = 0.0;
  int quantity = 1;
  Map<String, dynamic> selectedModifiers = {};

  @override
  void initState() {
    super.initState();
    List<Product> products = DataService().product ?? [];
    Product? product = products.firstWhere((prod) => prod.id == widget.id);
    modifiedPrice = (basePrice + priceFromModifier) * quantity;
    basePrice = product.salesRate;
    modifiedPrice = basePrice;
  }

  void updatePrice(double modifiersPrice) {
    setState(() {
      priceFromModifier = modifiersPrice;
      modifiedPrice = (basePrice + priceFromModifier) * quantity;
    });
  }

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
      modifiedPrice = (basePrice + priceFromModifier) * quantity;
    });
  }

  Future<void> saveProductToSharedPreferences(Product product,
      Map<String, dynamic> selectedModifiers, double productTotalPrice) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? cartJson = prefs.getString('cart');
    Map<String, dynamic> cartData;

    if (cartJson != null) {
      cartData = jsonDecode(cartJson);
    } else {
      cartData = {
        "cardOrMrNo": prefs.getString('cardOrMrNo'),
        "deliveryType": prefs.getString('deliveryType'),
        "products": []
      };
    }

    Map<String, dynamic> productData = {
      "productID": product.id,
      "name": product.item,
      "image": product.itemImage,
      "price": product.salesRate,
      "masterBarCode": product.barCode,
      "variant": null,
      "quantity": quantity.toString(),
      "addedAt": DateTime.now().toString(),
      "modifiers": selectedModifiers,
      "productTotalPrice": productTotalPrice
    };

    (cartData['products'] as List).add(productData);
    print(cartData);

    String updatedCartJson = jsonEncode(cartData);
    await prefs.setString('cart', updatedCartJson);

  }

  Future<List<Product>?> getProductsFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? cartJson = prefs.getString('cart');

    if (cartJson != null) {
      Map<String, dynamic> cartData = jsonDecode(cartJson);
      print('Retrieved Cart JSON: $cartData');

      List<dynamic> productList = cartData['products'];
      List<Product> products = productList
          .map((productMap) => Product.fromJson(productMap))
          .toList();

      return products;
    }
    return null;
  }

  void updateSelectedModifiers(Map<String, dynamic> modifiers) {
    setState(() {
      selectedModifiers = modifiers;
    });
  }

  bool _areAllRequiredModifiersSelected(Product product) {
    if (product.modifiers != null && product.modifiers!.isNotEmpty) {
      for (var groupName in product.modifiers!.keys) {
        var group = product.modifiers![groupName];
        if (group?.isMandatory == true &&
            !selectedModifiers.containsKey(groupName)) {
          return false;
        }
      }
    }
    return true;
  }

  Widget build(BuildContext context) {
    List<Product> products = DataService().product ?? [];

    Product? product = products.firstWhere((prod) => prod.id == widget.id);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    if (product == null) {
      return const Scaffold(
        body: Center(
          child: Text('Product not found'),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                bottom: screenHeight * 0.2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const primaryBackButton(),
                          SizedBox(width: screenHeight * 0.02),
                          const PrimaryLabel('Details'),
                        ],
                      ),
                      const CartButton(),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            product.itemImage,
                            width: screenWidth * 0.6,
                            height: screenHeight * 0.25,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDetailTitle(product.item),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'PKR: ${product.salesRate}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_border,
                              color: Colors.red, size: screenWidth * 0.06),
                          SizedBox(width: screenWidth * 0.02),
                          const PrimaryTitle('4.7'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.local_shipping_outlined,
                              color: Colors.red, size: screenWidth * 0.06),
                          SizedBox(width: screenWidth * 0.02),
                          const NormalTitle('Free'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined,
                              color: Colors.red, size: screenWidth * 0.06),
                          SizedBox(width: screenWidth * 0.02),
                          const NormalTitle('20 to 30 min'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProductDetailTitle('Description'),
                      SizedBox(height: screenHeight * 0.01),
                      DetailText(product.itemDescription),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ModifiersWidget(
                        product: product,
                        onPriceChange: updatePrice,
                        onModifiersChange: updateSelectedModifiers,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: screenHeight * 0.21,
                padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  top: screenHeight * 0.02,
                  right: screenWidth * 0.05,
                  bottom: screenWidth * 0.02,
                ),
                decoration: BoxDecoration(
                    color: AppColors.greyAccent,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductDetailTitle(
                            'PKR: ${(modifiedPrice).toStringAsFixed(2)}'),
                        InputQty(
                            // initVal: 1,
                            maxVal: 50,
                            minVal: 1,
                            // steps: 1,
                            decoration: QtyDecorationProps(
                              qtyStyle: QtyStyle.classic,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.015),
                              fillColor: AppColors.greyColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              minusBtn: Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * 0.03,
                                    right: screenWidth * 0.01),
                                child: SizedBox(
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            145, 158, 158, 158),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            screenHeight * 0.005),
                                        child: const Icon(
                                          Icons.remove,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      )),
                                ),
                              ),
                              plusBtn: Padding(
                                padding: EdgeInsets.only(
                                    right: screenWidth * 0.03,
                                    left: screenWidth * 0.01),
                                child: SizedBox(
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            145, 158, 158, 158),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            screenHeight * 0.005),
                                        child: const Icon(
                                          Icons.add,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            qtyFormProps: const QtyFormProps(
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            onQtyChanged: (value) {
                              int? parsedValue;

                              if (value is double) {
                                parsedValue = value.toInt();
                              } else if (value is String) {
                                parsedValue = int.tryParse(value.trim());
                              } else if (value is int) {
                                parsedValue = value;
                              }

                              if (parsedValue != null && parsedValue >= 1) {
                                updateQuantity(parsedValue);
                              } else {
                                print(
                                    'Invalid input: $value is not a valid integer or less than 1');
                              }
                            })
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StyledButton(
                          onPressed: () {
                            bool allRequiredModifiersSelected =
                                _areAllRequiredModifiersSelected(product);

                            if (!allRequiredModifiersSelected) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please select all required modifiers'),
                                ),
                              );
                              return;
                            }

                            saveProductToSharedPreferences(
                              product,
                              selectedModifiers,
                              modifiedPrice,
                            );

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => const CartScreen(),
                                ));
                          },
                          child: const WhiteText('ADD TO CART'),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class ModifiersWidget extends StatefulWidget {
  final Product product;
  final Function(double) onPriceChange;
  final Function(Map<String, dynamic>) onModifiersChange;

  ModifiersWidget({
    required this.product,
    required this.onPriceChange,
    required this.onModifiersChange,
  });

  @override
  _ModifiersWidgetState createState() => _ModifiersWidgetState();
}

class _ModifiersWidgetState extends State<ModifiersWidget> {
  Map<String, dynamic> selectedModifiers = {};
  double modifiersTotalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildModifiers(widget.product),
    );
  }

  List<Widget> buildModifiers(Product product) {
    List<Widget> modifierWidgets = [];

    if (product.modifiers != null && product.modifiers!.isNotEmpty) {
      product.modifiers!.forEach((groupName, group) {
        modifierWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalTitle('$groupName: '),
                NormalTitle(group.isMandatory ? '(Required)' : '(Optional)'),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Wrap(
                    spacing: 8.0,
                    children: group.items.map((item) {
                      bool isSelected = _isModifierSelected(groupName, item);

                      return isSelected
                          ? ModifiersSelectedButton(
                              onPressed: () {
                                setState(() {
                                  _removeModifier(groupName, item);
                                  widget.onPriceChange(modifiersTotalPrice);
                                  widget.onModifiersChange(selectedModifiers);
                                });
                              },
                              child: Text(item.name),
                            )
                          : ModifiersButton(
                              onPressed: () {
                                setState(() {
                                  if (!group.isMandatory) {
                                    _addModifier(groupName, item);
                                  } else {
                                    _replaceModifier(groupName, item);
                                  }

                                  widget.onPriceChange(modifiersTotalPrice);
                                  widget.onModifiersChange(selectedModifiers);
                                });
                              },
                              child: Text(item.name),
                            );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    }
    return modifierWidgets;
  }

  void _addModifier(String groupName, ModifierItem item) {
    if (selectedModifiers[groupName] == null) {
      selectedModifiers[groupName] = [
        {
          "name": item.name,
          "barcode": item.barcode,
          "amount": item.amount,
          "get_rate_from_modifier": item.getRateFromModifier ? 1 : 0,
        }
      ];
    } else {
      (selectedModifiers[groupName] as List).add({
        "name": item.name,
        "barcode": item.barcode,
        "amount": item.amount,
        "get_rate_from_modifier": item.getRateFromModifier ? 1 : 0,
      });
    }

    _recalculateModifiersTotalPrice();
  }

  void _removeModifier(String groupName, ModifierItem item) {
    List<dynamic> groupModifiers = selectedModifiers[groupName];
    groupModifiers.removeWhere((modifier) => modifier["name"] == item.name);

    if (groupModifiers.isEmpty) {
      selectedModifiers.remove(groupName);
    }

    _recalculateModifiersTotalPrice();
  }

  void _replaceModifier(String groupName, ModifierItem item) {
    selectedModifiers[groupName] = [
      {
        "name": item.name,
        "barcode": item.barcode,
        "amount": item.amount,
        "get_rate_from_modifier": item.getRateFromModifier ? 1 : 0,
      }
    ];

    _recalculateModifiersTotalPrice();
  }

  void _recalculateModifiersTotalPrice() {
    double total = 0.0;

    selectedModifiers.forEach((groupName, modifiersList) {
      for (var modifier in modifiersList) {
        if (modifier['get_rate_from_modifier'] == 1) {
          total += modifier['amount'];
        }
      }
    });

    setState(() {
      modifiersTotalPrice = total;
      widget.onPriceChange(modifiersTotalPrice);
    });
  }

  bool _isModifierSelected(String groupName, ModifierItem item) {
    if (selectedModifiers[groupName] is List) {
      return (selectedModifiers[groupName] as List)
          .any((modifier) => modifier["name"] == item.name);
    }
    return false;
  }

  bool _areMandatoryModifiersSelected(Product product) {
    if (product.modifiers == null || product.modifiers!.isEmpty) {
      return true;
    }

    bool allSelected = true;

    product.modifiers!.forEach((groupName, group) {
      if (group.isMandatory &&
          (selectedModifiers[groupName] == null ||
              selectedModifiers[groupName].isEmpty)) {
        allSelected = false;
      }
    });

    return allSelected;
  }
}
