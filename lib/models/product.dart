class Product {
  final int id;
  final String barCode;
  final String item;
  final String itemImage;
  final double rate;
  final double salesRate;
  final String categoryCode;
  final int isModifier;
  final String itemDescription;
  final String itemType;
  final Map<String, ModifierGroup>? modifiers;

  Product({
    required this.id,
    required this.barCode,
    required this.item,
    required this.itemImage,
    required this.rate,
    required this.salesRate,
    required this.categoryCode,
    required this.isModifier,
    required this.itemDescription,
    required this.itemType,
    this.modifiers,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    Map<String, ModifierGroup>? modifiers;

    if (json['modifiers'] != null) {
      modifiers = (json['modifiers'] as Map<String, dynamic>).map((key, value) {
        return MapEntry(key, ModifierGroup.fromJson(value));
      });
    }

    return Product(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()), 
      barCode: json['BarCode'],
      item: json['Item'],
      itemImage: json['ItemImage'],
      rate: double.parse(json['Rate'].toString()),
      salesRate: double.parse(json['SalesRate'].toString()),
      categoryCode: json['CategoryCode'],
      isModifier: json['IsModifier'],
      itemDescription: json['item_description'],
      itemType: json['item_type'],
      modifiers: modifiers,
    );
  }
}

class ModifierGroup {
  final bool isMandatory;
  final List<ModifierItem> items;

  ModifierGroup({required this.isMandatory, required this.items});

  factory ModifierGroup.fromJson(Map<String, dynamic> json) {
    List<ModifierItem> items = [];
    json.forEach((key, value) {
      if (key != 'is_mandatory') {
        items.add(ModifierItem.fromJson(value));
      }
    });

    return ModifierGroup(
      isMandatory: json['is_mandatory'] == 1,
      items: items,
    );
  }
}

class ModifierItem {
  final String name;
  final String barcode;
  final double amount;
  final bool getRateFromModifier;

  ModifierItem({
    required this.name,
    required this.barcode,
    required this.amount,
    required this.getRateFromModifier,
  });

  factory ModifierItem.fromJson(Map<String, dynamic> json) {
    return ModifierItem(
      name: json['name'],
      barcode: json['barcode'],
      amount: double.parse(json['amount']),
      getRateFromModifier: json['get_rate_from_modifier'] == 1,
    );
  }
}
