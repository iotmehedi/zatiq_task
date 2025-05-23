class ProductListModel {
  int? currentPage;
  List<ProductListData>? productListData;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  var prevPageUrl;
  int? to;
  int? total;

  ProductListModel(
      {this.currentPage,
        this.productListData,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      productListData = <ProductListData>[];
      json['data'].forEach((v) {
        productListData!.add(new ProductListData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.productListData != null) {
      data['data'] = this.productListData!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class ProductListData {
  int? id;
  String? name;
  String? buyingPrice;
  String? sellingPrice;
  int? stock;
  String? img;
  String? brandName;
  String? categoryName;
  String? status;
  String? createdAt;
  String? updatedAt;

  ProductListData(
      {this.id,
        this.name,
        this.buyingPrice,
        this.sellingPrice,
        this.stock,
        this.img,
        this.brandName,
        this.categoryName,
        this.status,
        this.createdAt,
        this.updatedAt});

  ProductListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    buyingPrice = json['buying_price'];
    sellingPrice = json['selling_price'];
    stock = json['stock'];
    img = json['img'];
    brandName = json['brand_name'];
    categoryName = json['category_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['buying_price'] = this.buyingPrice;
    data['selling_price'] = this.sellingPrice;
    data['stock'] = this.stock;
    data['img'] = this.img;
    data['brand_name'] = this.brandName;
    data['category_name'] = this.categoryName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
