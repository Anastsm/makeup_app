import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:makeup_app/repositories/models/product.dart';
import 'package:makeup_app/repositories/products_repository.dart';
import 'package:makeup_app/router/router.dart';
import 'package:makeup_app/repositories/models/search_filters.dart'; // Import the SearchFilters model

@RoutePage()
class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({super.key});

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  final SearchFilters searchFilters = SearchFilters();
  List<Product>? products;

  Future<void> getData() async {
    List<Product>? data = await ProductsAPI.getProducts(
      searchFilters.productType,
      searchFilters.productTags,
      searchFilters.priceGreaterThan,
      searchFilters.priceLessThan,
    );
    setState(() {
      products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Find products'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButton<String>(
                hint: const Text('Select Product Type'),
                value: searchFilters.productType,
                onChanged: (String? newValue) {
                  setState(() {
                    searchFilters.productType = newValue;
                  });
                },
                items: searchFilters.productTypes
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                hint: const Text('Select Tags'),
                value: searchFilters.productTags,
                onChanged: (String? newValue) {
                  setState(() {
                    searchFilters.productTags = newValue;
                  });
                },
                items: searchFilters.tags
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Price Greater Than',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    searchFilters.priceGreaterThan = double.tryParse(value);
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Price Less Than',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    searchFilters.priceLessThan = double.tryParse(value);
                  });
                },
              ),
              TextButton(
                onPressed: () async {
                  await getData();
                  AutoRouter.of(context)
                      .push(SearchResultsRoute(products: products));
                },
                child: const Text('show the results'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
