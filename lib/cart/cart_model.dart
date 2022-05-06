class CartModel {

   int id;
   int productCategoryId;
   String productName;
   int productPrice;
   int quantity;
   String unitTag;
   String image;

  CartModel({
    required this.id ,
    required this.productCategoryId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.unitTag,
    required this.image
  });

  CartModel.fromMap(Map<dynamic , dynamic>  res)
      : id = res['id'],
        productCategoryId = res["productCategoryId"],
        productName = res["productName"],
        productPrice = res["productPrice"],
        quantity = res["quantity"],
        unitTag = res["unitTag"],
        image = res["image"];

  Map<String, Object?> toMap(){
    return {
      'id' : id ,
      'productCategoryId' : productCategoryId,
      'productName' :productName,
      'productPrice' : productPrice,
      'quantity' : quantity,
      'unitTag' : unitTag,
      'image' : image,
    };
  }
}