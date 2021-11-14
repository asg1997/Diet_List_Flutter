import 'package:diet_list_flutter/Models/diet_model.dart';
import 'package:flutter/material.dart';

class ProductCell extends StatefulWidget {
  const ProductCell({Key? key,
    required this.product

  }) : super(key: key);

  final Product product;

  @override
  _ProductCellState createState() => _ProductCellState();
}

class _ProductCellState extends State<ProductCell> {
  @override
  Widget build(BuildContext context) {
    return buildProduct(widget.product);
  }
 // TODO: сделать иконку
  Widget buildProduct(Product product) => ListTile(
    title: Text(product.name),
  );

}
