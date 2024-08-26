class Product {
    Product({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    final List<ProductElement> products;
    final int? total;
    final int? skip;
    final int? limit;

    factory Product.fromJson(Map<String, dynamic> json){ 
        return Product(
            products: json["products"] == null ? [] : List<ProductElement>.from(json["products"]!.map((x) => ProductElement.fromJson(x))),
            total: json["total"],
            skip: json["skip"],
            limit: json["limit"],
        );
    }

    Map<String, dynamic> toJson() => {
        "products": products.map((x) => x.toJson()).toList(),
        "total": total,
        "skip": skip,
        "limit": limit,
    };

}

class ProductElement {
    ProductElement({
        required this.id,
        required this.title,
        required this.description,
        required this.category,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.tags,
        required this.brand,
        required this.sku,
        required this.weight,
        required this.dimensions,
        required this.warrantyInformation,
        required this.shippingInformation,
        required this.availabilityStatus,
        required this.reviews,
        required this.returnPolicy,
        required this.minimumOrderQuantity,
        required this.meta,
        required this.images,
        required this.thumbnail,
    });

    final int? id;
    final String? title;
    final String? description;
    final String? category;
    final double? price;
    final double? discountPercentage;
    final double? rating;
    final int? stock;
    final List<String> tags;
    final String? brand;
    final String? sku;
    final double? weight;  // Updated to double
    final Dimensions? dimensions;
    final String? warrantyInformation;
    final String? shippingInformation;
    final String? availabilityStatus;
    final List<Review> reviews;
    final String? returnPolicy;
    final int? minimumOrderQuantity;
    final Meta? meta;
    final List<String> images;
    final String? thumbnail;

    factory ProductElement.fromJson(Map<String, dynamic> json) { 
        return ProductElement(
            id: json["id"],
            title: json["title"],
            description: json["description"],
            category: json["category"],
            price: (json["price"] as num?)?.toDouble(),  // Explicitly casting to double
            discountPercentage: (json["discountPercentage"] as num?)?.toDouble(),  // Explicitly casting to double
            rating: (json["rating"] as num?)?.toDouble(),  // Explicitly casting to double
            stock: json["stock"],
            tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
            brand: json["brand"],
            sku: json["sku"],
            weight: (json["weight"] as num?)?.toDouble(),  // Explicitly casting to double
            dimensions: json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]),
            warrantyInformation: json["warrantyInformation"],
            shippingInformation: json["shippingInformation"],
            availabilityStatus: json["availabilityStatus"],
            reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
            returnPolicy: json["returnPolicy"],
            minimumOrderQuantity: json["minimumOrderQuantity"],
            meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
            images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
            thumbnail: json["thumbnail"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": tags.map((x) => x).toList(),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus": availabilityStatus,
        "reviews": reviews.map((x) => x.toJson()).toList(),
        "returnPolicy": returnPolicy,
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta?.toJson(),
        "images": images.map((x) => x).toList(),
        "thumbnail": thumbnail,
    };
}


class Dimensions {
    Dimensions({
        required this.width,
        required this.height,
        required this.depth,
    });

    final double? width;
    final double? height;
    final double? depth;

    factory Dimensions.fromJson(Map<String, dynamic> json) { 
        return Dimensions(
            width: (json["width"] as num?)?.toDouble(),  // Explicitly casting to double
            height: (json["height"] as num?)?.toDouble(),  // Explicitly casting to double
            depth: (json["depth"] as num?)?.toDouble(),  // Explicitly casting to double
        );
    }

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
    };
}


class Meta {
    Meta({
        required this.createdAt,
        required this.updatedAt,
        required this.barcode,
        required this.qrCode,
    });

    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? barcode;
    final String? qrCode;

    factory Meta.fromJson(Map<String, dynamic> json){ 
        return Meta(
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            barcode: json["barcode"],
            qrCode: json["qrCode"],
        );
    }

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
    };

}

class Review {
    Review({
        required this.rating,
        required this.comment,
        required this.date,
        required this.reviewerName,
        required this.reviewerEmail,
    });

    final int? rating;
    final String? comment;
    final DateTime? date;
    final String? reviewerName;
    final String? reviewerEmail;

    factory Review.fromJson(Map<String, dynamic> json){ 
        return Review(
            rating: json["rating"],
            comment: json["comment"],
            date: DateTime.tryParse(json["date"] ?? ""),
            reviewerName: json["reviewerName"],
            reviewerEmail: json["reviewerEmail"],
        );
    }

    Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "date": date?.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
    };

}
