// categories
class VendorCategories {
  const VendorCategories(this.id, this.title);
  final String id;
  final String title;
}

List<VendorCategories> categories = [
  VendorCategories("u1", "Electricity"),
  VendorCategories("u2", "Plumber"),
  VendorCategories("u3", "Cement"),
  VendorCategories("u4", "Electricity2"),
  VendorCategories("u5", "Plumber2"),
  VendorCategories("u6", "Cement2"),
];
// brands which depends on categories

class VendorBrands {
  const VendorBrands(this.id, this.categoryId, this.title);
  final String id;
  final String categoryId;
  final String title;
}

List<VendorBrands> brands = [
  VendorBrands("uu1", "u1", "Elswedy"),
  VendorBrands("uu2", "u1", "Venus"),
  VendorBrands("uu3", "u2", "Bosch"),
  VendorBrands("uu4", "u2", "ahmed"),
  VendorBrands("uu5", "u3", "momtaz"),
  VendorBrands("uu6", "u3", "semad"),
  VendorBrands("uu7", "u4", "Elswedy2"),
  VendorBrands("uu8", "u4", "Venus2"),
  VendorBrands("uu9", "u5", "Bosch2"),
  VendorBrands("uu10", "u5", "ahmed2"),
  VendorBrands("uu11", "u6", "momtaz2"),
  VendorBrands("uu12", "u6", "semad2"),
];
