import 'package:flutter/material.dart';
import 'package:food/models/category.dart';
import 'package:food/models/product.dart';
import 'package:food/screens/productDetail.dart';
import 'package:food/service/data_service.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';
import 'package:food/theme.dart';

class ProductTabs extends StatefulWidget {
  const ProductTabs({Key? key}) : super(key: key);

  @override
  State<ProductTabs> createState() => _ProductTabsState();
}

class _ProductTabsState extends State<ProductTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.buttonColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.016,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.016,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: const Color.fromRGBO(165, 167, 185, 1),
            tabs: const [
              Tab(text: 'Ready to Eat'),
              Tab(text: 'A la carte'),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                ReadyToEatTab(),
                AlaCarteTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReadyToEatTab extends StatelessWidget {
  const ReadyToEatTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    List<Categories>? readyToEatCategories = [
      Categories(
        id: '1',
        name: 'Fruits',
        image: 'assets/images/categories/rolls.png',
        categoryCode: 'F01',
        categoryType: 'ReadyToEat',
      ),
      Categories(
        id: '2',
        name: 'Salads',
        image: 'assets/images/categories/rolls.png',
        categoryCode: 'S01',
        categoryType: 'ReadyToEat',
      ),
      Categories(
        id: '3',
        name: 'Smoothies',
        image: 'assets/images/categories/rolls.png',
        categoryCode: 'SM01',
        categoryType: 'ReadyToEat',
      ),
    ];

    readyToEatCategories?.addAll(DataService().readyToEatCategories ?? []);
    List<Product> readyToEatProducts = DataService().readyToEatProducts ?? [];

    if (readyToEatCategories == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (readyToEatCategories.isEmpty) {
      return const Center(child: Text('No categories available'));
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PrimaryLabel('All Categories'),
                  SeeAllButton(
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: readyToEatCategories.length,
                itemBuilder: (context, index) {
                  final category = readyToEatCategories[index];
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(screenHeight * 0.02),
                        margin: EdgeInsets.symmetric(
                            horizontal: screenHeight * 0.015),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 201, 200, 200)
                                  .withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 14,
                              offset: const Offset(3, 8),
                            ),
                          ],
                        ),
                        child: category.image != null &&
                                category.image!.startsWith('assets/')
                            ? Image.asset(
                                category.image!,
                                width: screenWidth * 0.2,
                              )
                            : Image.network(
                                category.image ??
                                    'https://via.placeholder.com/30',
                                width: screenWidth * 0.2,
                              ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.01),
                          child:
                              PrimaryTitle(category.name ?? 'Unknown Category'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PrimaryLabel('Menu Items'),
                  SeeAllButton(onPressed: () {}),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemCount: readyToEatProducts.length,
              itemBuilder: (context, index) {
                final product = readyToEatProducts[index];
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenHeight * 0.02),
                      margin: EdgeInsets.symmetric(
                          horizontal: screenHeight * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 201, 200, 200)
                                .withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 14,
                            offset: const Offset(3, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              product.itemImage,
                              width: screenWidth * 0.6,
                              height: screenHeight * 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ProductTitle(product.item),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductTitle(
                                  'PKR ' + product.salesRate.toString()),
                              AddButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) =>
                                          ProductDetail(id: product.id),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      );
    }
  }
}

class AlaCarteTab extends StatelessWidget {
  const AlaCarteTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> alaCarteProducts = DataService().alaCarteProducts ?? [];
    List<Categories>? alaCarteCategories = DataService().alaCarteCategories;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    if (alaCarteCategories == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (alaCarteCategories.isEmpty) {
      return const Center(child: Text('No categories available'));
    } else {
      return
      SingleChildScrollView(
        child: 
       Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PrimaryLabel('All Categories'),
                SeeAllButton(
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: alaCarteCategories.length,
              itemBuilder: (context, index) {
                final category = alaCarteCategories[index];
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenHeight * 0.02),
                      margin: EdgeInsets.symmetric(
                          horizontal: screenHeight * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 201, 200, 200)
                                .withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 14,
                            offset: const Offset(3, 8),
                          ),
                        ],
                      ),
                      child: category.image != null &&
                              category.image!.startsWith('assets/')
                          ? Image.asset(
                              category.image!,
                              width: screenWidth * 0.2,
                            )
                          : Image.network(
                              category.image ??
                                  'https://via.placeholder.com/30',
                              width: screenWidth * 0.2,
                            ),
                    ),
                    Expanded(
                        child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      child: PrimaryTitle(category.name ?? 'Unknown Category'),
                    )),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PrimaryLabel('Menu Item’s'),
                SeeAllButton(
                  onPressed: () {},
                )
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .8,
            ),
            itemCount: alaCarteProducts.length,
            itemBuilder: (context, index) {
              final product = alaCarteProducts[index];
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(screenHeight * 0.02),
                    margin:
                        EdgeInsets.symmetric(horizontal: screenHeight * 0.015),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 201, 200, 200)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 14,
                          offset: const Offset(3, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            product.itemImage,
                            width: screenWidth * 0.6,
                            height: screenHeight * 0.1,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ProductTitle(product.item),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProductTitle('PKR ' + product.salesRate.toString()),
                            AddButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) =>
                                        ProductDetail(id: product.id),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          // const SizedBox(height: 20),
          // const Text(
          //   'More content goes here...',
          //   style: TextStyle(fontSize: 16, color: Colors.black),
          // ),
        ],
      )
      );
    }
  }
}
