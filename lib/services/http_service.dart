import 'dart:convert';

import 'package:charikati/models/client.dart';
import 'package:charikati/models/order.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/services/links.dart';
import 'package:http/http.dart';

class HttpService {
  Future<List<Product>> getProducts() async {
    Response response = await get(Uri.parse(productsUrl));
    var jsonResponse = json.decode(response.body);
    List<Product> products = [];
    for (var p in jsonResponse) {
      products.add(Product.fromJson(p));
    }
    return products;
  }

  Future<List<Cliente>> getClients() async {
    Response response = await get(Uri.parse(clientsUrl));
    var jsonResponse = json.decode(response.body);
    List<Cliente> clients = [];
    for (var c in jsonResponse) {
      clients.add(Cliente.fromJson(c));
    }
    return clients;
  }
   Future<List<Sell>> getClientSells(int id) async {
    Response response = await get(Uri.parse(sellsUrl+"?id=+$id"));
    var jsonResponse = json.decode(response.body);
    List<Sell> sells = [];
    for (var s in jsonResponse) {
      sells.add(Sell.fromJson(s));
    }
    return sells;
  }
  Future<List<OrderSell>> getSellOrders(int id) async {
    Response response = await get(Uri.parse(orderSellsUrl+"?id=+$id"));
    var jsonResponse = json.decode(response.body);
    List<OrderSell> orderSells = [];
    for (var os in jsonResponse) {
      orderSells.add(OrderSell.fromJson(os));
    }
    return orderSells;
  }

  Future<Cliente> insertClient(Cliente client) async {
    var data = client.toJson();
    Response response = await post(Uri.parse(addClientUrl),
        body: json.encode(data), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 201) {
      var body = await json.decode(response.body);
      return Cliente.fromJson(body);
    } else {
      throw "Unable to send cliente.";
    }
  }
Future<Sell> insertSell(Sell sell) async {
    var data = sell.toJson();
    Response response = await post(Uri.parse(addSellUrl),
        body: json.encode(data), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 201) {
      var body = await json.decode(response.body);
      return Sell.fromJson(body);
    } else {
      throw "Unable to send sell.";
    }
  }
  Future<Product> insertProduct(Product product) async {
    var data = product.toJson();
    Response response = await post(Uri.parse(addProductUrl),
        body: json.encode(data), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 201) {
      var body = await json.decode(response.body);
      return Product.fromJson(body);
    } else {
      throw "Unable to send product.";
    }
  }
  Future<OrderSell> insertOrderSell(OrderSell orderSell) async {
    var data = orderSell.toJson();
    Response response = await post(Uri.parse(addOrderSellUrl),
        body: json.encode(data), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 201) {
      var body = await json.decode(response.body);
      return OrderSell.fromJson(body);
    } else {
      throw "Unable to send orderSell.";
    }
  }

  Future<bool> deleteProduct(int id) async {
    Response response = await delete(Uri.parse(deleteProductUrl + "?id=$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
