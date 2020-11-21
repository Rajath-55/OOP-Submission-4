import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  final List<Product> products;
  Product(
      {this.id,
      this.image,
      this.title,
      this.price,
      this.description,
      this.size,
      this.color,
      this.products});

  getProducts() {
    return products;
  }
}

List<Product> products = [
  Product(
      id: 1,
      title: "Item 1",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Item 2",
      price: 100,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Item 3",
      price: 400,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Item 4",
      price: 399,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Item 5",
      price: 455,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Item 6",
    price: 64,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 7,
    title: "Item 7",
    price: 90,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFD3A984),
  ),
  Product(
    id: 8,
    title: "Item 8",
    price: 377,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFD3A984),
  ),
  Product(
    id: 9,
    title: "Item 9",
    price: 2400,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFF3D82AE),
  ),
  Product(
    id: 10,
    title: "Item 10",
    price: 221,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 11,
    title: "Item 11",
    price: 555,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFF3D82AE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
