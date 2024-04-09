//
//  Inventory.swift
//  Inventix
//
//  Created by Khanh Chung on 3/28/24.
//

import Foundation

struct Inventory {
    var products: [Product] = Product.example
    var categories: [Category] = Category.example
    var warehouses: [Warehouse] = Warehouse.example
    var orders: [Order] = Order.example
    
    mutating func addProduct(_ product: Product) {
        products.append(product)
    }
    
    mutating func deleteProduct(_ product: Product) {
        products.removeAll(where: { $0.id == product.id })
    }
    
    mutating func updateProduct(id: UUID, updatedProduct: Product) {
        products = products.map { $0.id != id ? $0 : updatedProduct }
    }
    
    mutating func addOrder(_ order: Order) {
        orders.append(order)
    }
    
    mutating func addWarehouse(_ warehouse: Warehouse) {
        warehouses.append(warehouse)
    }
    
    mutating func updateOrder(_ order: Order) {
        if let indexOrder = orders.firstIndex(where: { $0.id == order.id }) {
            let finalStock = abs(orders[indexOrder].stock - order.stock)
            if let indexProduct = products.firstIndex(where: { $0.sku == order.sku }) {
                if orders[indexOrder].stock > order.stock {
                    products[indexProduct].stock -= finalStock
                } else {
                    products[indexProduct].stock += finalStock
                }
                orders[indexOrder].stock = order.stock
            }
        }
    }
}
