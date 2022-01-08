import 'package:diet_list_flutter/Models/product_model.dart';
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/material.dart';

class ProductCell extends StatefulWidget {
  const ProductCell({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _ProductCellState createState() => _ProductCellState();
}

class _ProductCellState extends State<ProductCell> {
  @override
  Widget build(BuildContext context) {
    return buildProduct();
  }

  
  Widget buildProduct() => Container(
        height: 52,
        color: Colors.white,


        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(widget.product.name,
              style: ProjectFonts.tableText,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _setIcon(),
              ),
            ]),
            Container(
              height: 0.5,
              color: Colors.grey.withOpacity(0.5)
            )
          ],
        ),
      );


  Icon _setIcon() {
    switch (widget.product.status) {
      case 'permitted':
        return const Icon(Icons.check, color: Colors.green);
      case 'prohibited':
        return const Icon(
          Icons.close,
          color: Colors.red,
        );
    }
    return const Icon(Icons.help_outline);
  }
}
