import 'package:flutter/material.dart';

Map data = {
  "brands": [
    {
      "name": "Parachute",
      "logo": "assets/1.png",
      "products": [
       
        {
          "id":1,
          "sku": "SKU001",
          "name": "Parachute Coconut Oil",
          "price": 19.99,
          "promotion": "10% off"
        },
        {
          "id":2,
          "sku": "SKU002",
          "name": "Parachute Coconut Oil (Utshob Pack)",
          "price": 29.99,
          "promotion": "15% off"
        },
        {
          "id":3,
          "sku": "SKU001",
          "name": "Product 3",
          "price": 19.99,
          "promotion": "10% off"
        },
        {
          "id":4,
          "sku": "SKU002",
          "name": "Product 4",
          "price": 29.99,
          "promotion": "15% off"
        }, 
      ]
    },
    {
      "name": "Parachute Advansed",
      "logo": "assets/2.png",
      "products": [
        {
          "id":5,
          "sku": "SKU003",
          "name": "Parachute Advansed Extra Care",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":6,
          "sku": "SKU004",
          "name": "Parachute Advansed Beliphool ",
          "price": 39.99,
          "promotion": "5% off"
        },
        {
          "id":7,
          "sku": "SKU003",
          "name": "Product 3",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":8,
          "sku": "SKU004",
          "name": "Product 4",
          "price": 39.99,
          "promotion": "5% off"
        },
      ]
    },
    {
      "name": "Parachute Naturale",
      "logo": "assets/3.png",
      "products": [
        {
          "id":9,
          "sku": "SKU001",
          "name": "Nourishing Care Shampoo",
          "price": 19.99,
          "promotion": "10% off"
        },
        {
          "id":10,
          "sku": "SKU002",
          "name": "Product 2",
          "price": 29.99,
          "promotion": "15% off"
        },
        {
          "id":11,
          "sku": "SKU001",
          "name": "Product 3",
          "price": 19.99,
          "promotion": "10% off"
        },
        {
          "id":12,
          "sku": "SKU002",
          "name": "Product 4",
          "price": 29.99,
          "promotion": "15% off"
        },
      ]
    },
    {
      "name": "Mediker SafeLife",
      "logo": "assets/4.png",
      "products": [
        {
          "id":13,
          "sku": "SKU003",
          "name": " Hand Wash",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":14,
          "sku": "SKU004",
          "name": "Shap Bar",
          "price": 39.99,
          "promotion": "5% off"
        },
        {
          "id":15,
          "sku": "SKU003",
          "name": "Hand Wash",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":16,
          "sku": "SKU004",
          "name": "Product 4",
          "price": 39.99,
          "promotion": "5% off"
        },
      ]
    },
    {
      "name": "Parachute Skinpure ",
      "logo": "assets/5.png",
      "products": [
        {
          "id":17,
          "sku": "SKU001",
          "name": "Beauty Olive Oil",
          "price": 19.99,
          "promotion": "10% off"
        },
        {
          "id":18,
          "sku": "SKU002",
          "name": "Body Lotion",
          "price": 29.99,
          "promotion": "15% off"
        },
        {
          "id":19,
          "sku": "SKU001",
          "name": "Natural Moisture",
          "price": 19.99,
          "promotion": "10% off"
        },
        {
          "id":20,
          "sku": "SKU002",
          "name": "Product 4",
          "price": 29.99,
          "promotion": "15% off"
        },
      ]
    },
    {
      "name": "Livon",
      "logo": "assets/6.png",
      "products": [
        {
          "id":21,
          "sku": "SKU003",
          "name": "Hair Essentials",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":22,
          "sku": "SKU004",
          "name": "Product 2",
          "price": 39.99,
          "promotion": "5% off"
        },
        {
          "id":23,
          "sku": "SKU003",
          "name": "Product 3",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":24,
          "sku": "SKU004",
          "name": "Product 4",
          "price": 39.99,
          "promotion": "5% off"
        }
      ]
    },
 
 
    {
      "name": "Red King",
      "logo": "assets/7.png",
      "products": [
        {
          "id":25,
          "sku": "SKU003",
          "name": "Men’s Cooling Oil",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":26,
          "sku": "SKU004",
          "name": "Product 2",
          "price": 39.99,
          "promotion": "5% off"
        },
        {
          "id":27,
          "sku": "SKU003",
          "name": "Product 3",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":28,
          "sku": "SKU004",
          "name": "Product 4",
          "price": 39.99,
          "promotion": "5% off"
        },
      ]
    },
 
 
    {
      "name": "Just for Baby ",
      "logo": "assets/9.png",
      "products": [
        {
          "id":29,
          "sku": "SKU003",
          "name": "Baby Lotion(200 Ml)",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":30,
          "sku": "SKU004",
          "name": "Baby Rash Cream (100G)",
          "price": 39.99,
          "promotion": "5% off"
        },
        {
          "id":31,
          "sku": "SKU003",
          "name": "Product 3",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":32,
          "sku": "SKU004",
          "name": "Product 4",
          "price": 39.99,
          "promotion": "5% off"
        },
      ]
    },
 
 
 
    {
      "name": "Saffola",
      "logo": "assets/10.jpg",
      "products": [
        {
          "id":33,
          "sku": "SKU003",
          "name": "Saffola Honey",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":34,
          "sku": "SKU004",
          "name": "Saffola Active Plus",
          "price": 39.99,
          "promotion": "5% off"
        },
        {
          "id":35,
          "sku": "SKU003",
          "name": "Product 3",
          "price": 24.99,
          "promotion": "20% off"
        },
        {
          "id":36,
          "sku": "SKU004",
          "name": "Product 4",
          "price": 39.99,
          "promotion": "5% off"
        },
      ]
    },
 
 
 
  ]
};
