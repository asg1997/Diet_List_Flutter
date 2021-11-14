import 'package:diet_list_flutter/Components/custom_app_bar.dart';
import 'package:diet_list_flutter/Components/menu_cell.dart';
import 'package:diet_list_flutter/Components/product_cell.dart';
import 'package:diet_list_flutter/Components/search_widget.dart';
import 'package:diet_list_flutter/Models/diet_model.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String query = '';


  late List<Product> filteredProductList;
  List<Product> productList = [
    Product('apple', 'prohibitted'),
    Product('cola', 'prohibitted'),
    Product('mango', 'prohibitted'),
    Product('pepsi', 'permitted'),
    Product('potato', 'permitted'),
  ];


  @override
  void initState() {
    super.initState();

    filteredProductList = productList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar().create('Список продуктов'),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fon.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter
              )
            ),
          ),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    buildSearch(),
                    Expanded(
                        child: ListView.builder(
                        itemCount: filteredProductList.length,
                        itemBuilder: (BuildContext context, int index){
                          final product = productList[index];
                          return ProductCell(product: product );
                        }))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
      text: query,
      hintText: 'Поиск продуктов',
      onChanged: searchProduct,
  );

  void searchProduct(String query) {
    final filteredProductList = productList.where((product) {
      final titleLower = product.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.filteredProductList = filteredProductList;
    });

  }

}

