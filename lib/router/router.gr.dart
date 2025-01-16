// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [ProductSearchScreen]
class ProductSearchRoute extends PageRouteInfo<void> {
  const ProductSearchRoute({List<PageRouteInfo>? children})
    : super(ProductSearchRoute.name, initialChildren: children);

  static const String name = 'ProductSearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductSearchScreen();
    },
  );
}

/// generated route for
/// [SearchResultsScreen]
class SearchResultsRoute extends PageRouteInfo<SearchResultsRouteArgs> {
  SearchResultsRoute({
    Key? key,
    required List<Product>? products,
    List<PageRouteInfo>? children,
  }) : super(
         SearchResultsRoute.name,
         args: SearchResultsRouteArgs(key: key, products: products),
         initialChildren: children,
       );

  static const String name = 'SearchResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchResultsRouteArgs>();
      return SearchResultsScreen(key: args.key, products: args.products);
    },
  );
}

class SearchResultsRouteArgs {
  const SearchResultsRouteArgs({this.key, required this.products});

  final Key? key;

  final List<Product>? products;

  @override
  String toString() {
    return 'SearchResultsRouteArgs{key: $key, products: $products}';
  }
}

/// generated route for
/// [SingleProductScreen]
class SingleProductRoute extends PageRouteInfo<SingleProductRouteArgs> {
  SingleProductRoute({
    Key? key,
    required Product product,
    List<PageRouteInfo>? children,
  }) : super(
         SingleProductRoute.name,
         args: SingleProductRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'SingleProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SingleProductRouteArgs>();
      return SingleProductScreen(key: args.key, product: args.product);
    },
  );
}

class SingleProductRouteArgs {
  const SingleProductRouteArgs({this.key, required this.product});

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'SingleProductRouteArgs{key: $key, product: $product}';
  }
}
