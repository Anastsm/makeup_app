import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:makeup_app/repositories/models/product.dart';
import 'package:makeup_app/screens/home_screen.dart';
import 'package:makeup_app/screens/product_search_screen.dart';
import 'package:makeup_app/screens/search_results_screen.dart';
import 'package:makeup_app/screens/single_product_screen.dart';

part 'router.gr.dart';
@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: ProductSearchRoute.page),
    AutoRoute(page: SearchResultsRoute.page),
    AutoRoute(page: SingleProductRoute.page),
  ];
}