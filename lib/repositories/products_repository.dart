import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:makeup_app/repositories/models/product.dart';

class ProductsAPI{

  static Future<List<Product>?> getProducts(
    String? productType,
    String? productTags,
    double? priceGreaterThan,
    double? priceLessThan
    ) async {   
      try{
        final queryParams = <String, String>{};

        if (productType != null) queryParams['product_type'] = productType;
        if (productTags != null) queryParams['tag_list'] = productTags;
        if (priceGreaterThan != null) queryParams['price_greater_than'] = priceGreaterThan.toString();
        if (priceLessThan != null) queryParams['price_less_than'] = priceLessThan.toString();

        Uri uri;
        if (queryParams.isEmpty){
          uri = Uri.https('makeup-api.herokuapp.com', 'api/v1/products.json');
        }
        else {
          uri = Uri.https('makeup-api.herokuapp.com', 'api/v1/products.json', queryParams);
        }

        final response = await http.get(uri);
        List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        List<Product> products = [];

        for (int i = 0; i < data.length; i++){
          if (i == 30) break;   

          final object = data[i];
          Product product = Product(
            object['brand'] ?? 'Unknown',              
            object['name'] ?? 'Unknown',               
            double.parse(object['price']), 
            object['image_link'] ?? 'Unknown',         
            object['description'] ?? 'Unknown',        
            object['product_type'] ?? 'Unknown',      
            object['category'] ?? 'Unknown',          
            (object['tag_list'] as List<dynamic>?)?.map((tag) => tag.toString()).toList() , 
            (object['product_colors'] as List<dynamic>?)?.map((color) => color.toString()).toList(), 
          );
          
          products.add(product);
        }
        return products;
      }
      catch (e){
        return null;
      }
  }
}