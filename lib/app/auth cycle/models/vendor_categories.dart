class VendorCategories {
  const VendorCategories(this.id, this.title);
  final String id;
  final String title;
}

List<VendorCategories> categories = [
  VendorCategories("u1", "Electricity"),
  VendorCategories("u2", "Plumber"),
  VendorCategories("u3", "Cement"),
];
