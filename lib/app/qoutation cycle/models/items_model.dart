class ItemsModel {
  const ItemsModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.brandName,
    required this.size,
    required this.price,
  });
  final String id;
  final String name;
  final int quantity;
  final String brandName;
  final String size;
  final double price;
}

List<ItemsModel> items = [
  ItemsModel(
    id: "u1",
    name: "2mm Swedish wire roll",
    quantity: 29,
    brandName: "Swedish",
    size: "2mm",
    price: 0,
  ),
  ItemsModel(
    id: "u2",
    name: "4mm Swedish wire roll",
    quantity: 29,
    brandName: "Swedish",
    size: "4mm",
    price: 0,
  ),
  ItemsModel(
    id: "u3",
    name: "6mm Swedish wire roll",
    quantity: 29,
    brandName: "Swedish",
    size: "6mm",
    price: 0,
  ),
  ItemsModel(
    id: "u4",
    name: "8mm Swedish wire roll",
    quantity: 29,
    brandName: "Swedish",
    size: "8mm",
    price: 0,
  ),
];

List<ItemsModel> plumbItems = [
  ItemsModel(
    id: "u1",
    name: "8mm pipe",
    quantity: 29,
    brandName: "ahmed",
    size: "8mm",
    price: 0,
  ),
  ItemsModel(
    id: "u2",
    name: "4mm pipe",
    quantity: 29,
    brandName: "ahmed",
    size: "4mm",
    price: 0,
  ),
];
