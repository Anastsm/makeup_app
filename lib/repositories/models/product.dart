class Product{
  late String brand;
  late String name;
  late double price;
  late String image_link;
  late String description;
  late String product_type;
  late String category;
  late List<String>? tag_list;
  late List<String>? product_colors;

  Product(String _brand, String _name, double _price, String _image_link, String _description, String _product_type, String _category, List<String>? _tag_list, List<String>? _product_colors) {
    brand = _brand;
    name = _name;
    price = _price;
    image_link = _image_link;
    description = _description;
    product_type = _product_type;
    category = _category;
    tag_list = _tag_list;
    product_colors = _product_colors;
  }

}

