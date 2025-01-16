import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:makeup_app/repositories/models/product.dart';

@RoutePage()
class SingleProductScreen extends StatefulWidget {
  final Product product;
  const SingleProductScreen({
    super.key,
    required this.product
    });

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  @override
  Widget build(BuildContext context) {
    Product product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.image_link),
            SizedBox(height: 16),
            Text(product.name, style: Theme.of(context).textTheme.titleLarge),
            Text(product.brand, style: Theme.of(context).textTheme.titleMedium),
            Text('\$${product.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red)),
            SizedBox(height: 16),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}