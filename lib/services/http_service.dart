import 'dart:convert';

import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/models/buy.dart';
import 'package:charikati/models/client.dart';
import 'package:charikati/models/forni.dart';
import 'package:charikati/models/order_buy.dart';
import 'package:charikati/models/order_sell.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/models/user.dart';
import 'package:charikati/services/links.dart';
import 'package:http/http.dart';

class HttpService {
  Future<List<Product>> getProducts() async {
    Response response = await get(Uri.parse(productsUrl));
    var jsonResponse = json.decode(response.body);
    List<Product> products = [];
    for (var p in jsonResponse["content"]) {
      products.add(Product.fromJson(p));
    }
    return products;
  }

  Future<List<Product>> getMoreProducts(int page) async {
    Response response = await get(Uri.parse(productsUrl+"?page=$page"));
    var jsonResponse = json.decode(response.body);
    List<Product> products = [];
    
    for (var p in jsonResponse["content"]) {
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

  Future<List<Forni>> getFornis() async {
    Response response = await get(Uri.parse(fornisUrl));
    var jsonResponse = json.decode(response.body);
    List<Forni> fornis = [];
    for (var f in jsonResponse) {
      fornis.add(Forni.fromJson(f));
    }
    return fornis;
  }
 Future<List<Sell>> getAllSells() async {
    Response response = await get(Uri.parse(getAllSellsUrl));
    var jsonResponse = json.decode(response.body);
    List<Sell> sells = [];
    for (var s in jsonResponse) {
      sells.add(Sell.fromJson(s));
    }
    return sells;
  }
  Future<List<Buy>> getAllBuys() async {
    Response response = await get(Uri.parse(getAllBuysUrl));
    var jsonResponse = json.decode(response.body);
    List<Buy> buys = [];
    for (var b in jsonResponse) {
      buys.add(Buy.fromJson(b));
    }
    return buys;
  }
  Future<int> getSellsTotal() async {
    Response response = await get(Uri.parse(getSellsTotalUrl));
    var jsonResponse = json.decode(response.body);
    return jsonResponse;
  }
  Future<int> getBuysTotal() async {
    Response response = await get(Uri.parse(getBuysTotalUrl));
    var jsonResponse = json.decode(response.body);
    return jsonResponse;
  }

  Future<Sell> getSellById(int id) async {
    Response response = await get(Uri.parse(getSellUrl + "?id=+$id"));
    var jsonResponse = json.decode(response.body);
    return Sell.fromJson(jsonResponse);
  }

  Future<Buy> getBuyById(int id) async {
    Response response = await get(Uri.parse(getById + "?id=+$id"));
    var jsonResponse = json.decode(response.body);
    return Buy.fromJson(jsonResponse);
  }
  Future<Forni> getForniById(int id) async {
    Response response = await get(Uri.parse(getForniByIdUrl + "?id=+$id"));
    var jsonResponse = json.decode(response.body);
    return Forni.fromJson(jsonResponse);
  }
  Future<Cliente> getClientById(int id) async {
    Response response = await get(Uri.parse(getClientByIdUrl + "?id=+$id"));
    var jsonResponse = json.decode(response.body);
    return Cliente.fromJson(jsonResponse);
  }

  Future<List<Sell>> getClientSells(int id) async {
    Response response = await get(Uri.parse(sellsUrl + "?id=+$id"));
    var jsonResponse = json.decode(response.body);
    List<Sell> sells = [];
    for (var s in jsonResponse) {
      sells.add(Sell.fromJson(s));
    }
    return sells;
  }

  Future<List<Buy>> getForniBuys(int id) async {
    Response response = await get(Uri.parse(buysUrl + "?id=+$id"));
    var jsonResponse = json.decode(response.body);
    List<Buy> buys = [];
    for (var b in jsonResponse) {
      buys.add(Buy.fromJson(b));
    }
    return buys;
  }

  Future<List<OrderSell>> getSellOrders(int id) async {
    Response response = await get(Uri.parse(orderSellsUrl + "?id=+$id"));
    var jsonResponse = json.decode(response.body);
    List<OrderSell> orderSells = [];
    for (var os in jsonResponse) {
      orderSells.add(OrderSell.fromJson(os));
    }
    return orderSells;
  }

  Future<List<OrderBuy>> getBuyOrders(int id) async {
    Response response = await get(Uri.parse(orderBuysUrl + "?id=+$id"));
    var jsonResponse = json.decode(response.body);
    List<OrderBuy> orderBuys = [];
    for (var ob in jsonResponse) {
      orderBuys.add(OrderBuy.fromJson(ob));
    }
    return orderBuys;
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
  

  Future<Forni> insertForni(Forni forni) async {
    var data = forni.toJson();
    Response response = await post(Uri.parse(addForniUrl),
        body: json.encode(data), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 201) {
      var body = await json.decode(response.body);
      return Forni.fromJson(body);
    } else {
      throw "Unable to send forni.";
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

  Future<Buy> insertBuy(Buy buy) async {
    var data = buy.toJson();
    Response response = await post(Uri.parse(addBuyUrl),
        body: json.encode(data), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 201) {
      var body = await json.decode(response.body);
      return Buy.fromJson(body);
    } else {
      throw "Unable to send buy.";
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

  Future<OrderBuy> insertOrderBuy(OrderBuy orderBuy) async {
    var data = orderBuy.toJson();
    Response response = await post(Uri.parse(addOrderBuyUrl),
        body: json.encode(data), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 201) {
      var body = await json.decode(response.body);
      return OrderBuy.fromJson(body);
    } else {
      throw "Unable to send orderBuy.";
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


   Future<bool> deleteBuy(int id) async {
    Response response = await delete(Uri.parse(deleteBuyUrl + "?id=$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

   Future<bool> deleteClient(int id) async {
    Response response = await delete(Uri.parse(deleteClientUrl + "?id=$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
   Future<bool> deleteForni(int id) async {
    Response response = await delete(Uri.parse(deleteForniUrl + "?id=$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
   Future<bool> deleteOrderBuy(int id) async {
    Response response = await delete(Uri.parse(deleteOrderBuyUrl + "?id=$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

   Future<bool> deleteOrderSell(int id) async {
    Response response = await delete(Uri.parse(deleteOrderSellUrl + "?id=$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
   Future<bool> deleteSell(int id) async {
    Response response = await delete(Uri.parse(deleteSellUrl + "?id=$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

   Future<User?> loginUser(String name, String password) async {
    // var response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = {
      "name": name,
      "password": password,
    };
    Response response = await post(Uri.parse(loginUrl),
        body: json.encode(data), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      if (response.body == "") {
        return null;
      } else {
        var body = await json.decode(response.body);
        return User.fromJson(body);
      }
    } else {
      throw "Unable to send rendv.";
    }
  }
  
}
