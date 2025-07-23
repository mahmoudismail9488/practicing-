import 'package:new_app/app/qoutation%20cycle/models/items_model.dart';

class QoutationModel {
  const QoutationModel({
    required this.id,
    required this.username,
    required this.mobile,
    required this.city,
    required this.street,
    required this.category,
    required this.paymentMethod,
    required this.date,
    required this.shipping,
    required this.items,
    required this.status,
  });
  final String id;
  final String username;
  final String mobile;
  final String city;
  final String street;
  final String category;
  final String paymentMethod;
  final DateTime date;
  final double shipping;
  final List<ItemsModel> items;
  final String status;
}

List<QoutationModel> qoutations = [
  QoutationModel(
    id: "#120987",
    username: "Mahmoud ISmail",
    mobile: "01020634063",
    city: "Suez",
    street: "Cairo coop",
    category: "Electrical",
    paymentMethod: "Cash",
    date: DateTime(2025, 2, 25),
    shipping: 400,
    items: items,
    status: "Priced",
  ),
  QoutationModel(
    id: "#120922",
    username: "seif Ahmed",
    mobile: "01220224063",
    city: "Cairo",
    street: "Maadi",
    category: "Plumping",
    paymentMethod: "Visa",
    date: DateTime(2025, 4, 05),
    shipping: 220,
    items: plumbItems,
    status: "Expired",
  ),
];
