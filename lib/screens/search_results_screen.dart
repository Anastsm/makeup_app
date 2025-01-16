import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:makeup_app/repositories/models/product.dart';
import 'package:makeup_app/router/router.dart';


@RoutePage()
class SearchResultsScreen extends StatefulWidget {
  final List<Product>? products;

  const SearchResultsScreen({
    super.key,
    required this.products
    });

  @override
  State<SearchResultsScreen> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResultsScreen> {

  @override
  Widget build(BuildContext context) {
    List<Product>? products = widget.products;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: products == null || products.isEmpty
          ? const Center(child: Text('No products found'))
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.6, 
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(SingleProductRoute(product: product));

                  },
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            product.image_link,
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error, size: 150); 
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.name,
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.green,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            product.brand,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
