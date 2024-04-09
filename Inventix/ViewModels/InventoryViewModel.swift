//
//  InventoryViewModel.swift
//  Inventix
//
//  Created by Khanh Chung on 3/28/24.
//

import Foundation

@Observable
class InventoryViewModel {
    private var inventory: Inventory = Inventory()
    
    var products: [Product] {
        get { inventory.products }
        set { inventory.products = newValue }
    }
    
    var orders: [Order] {
        get { inventory.orders }
        set { inventory.orders = newValue }
    }
    
    var warehouses: [Warehouse] {
        get { inventory.warehouses }
        set { inventory.warehouses = newValue }
    }
    
    
    func updateProduct(id: UUID, updatedProduct: Product) {
        inventory.updateProduct(id: id, updatedProduct: updatedProduct)
    }
    
    func getProductBySKU(_ sku: String) -> Product? {
        return products.first { $0.sku == sku }
    }
    
    var categories: [Category] {
        get { inventory.categories }
        set { inventory.categories = newValue }
    }
    
    func productsByCategory(_ category: Category) -> [Product] {
        products.filter { $0.category.name == category.name }
    }
    
    func productsByWarehouse(_ warehouse: Warehouse) -> [Product] {
        products.filter { $0.warehouse.id == warehouse.id }
    }
    
    func restock(_ order: Order) {
        if let index = products.firstIndex(where: { $0.sku == order.sku }) {
            products[index].stock += order.stock
            inventory.addOrder(order)
        }
    }
    
    func moveOrder(_ order: Order) { // fixme
        inventory.addOrder(order)
    }
    
    func updateOrder(_ order: Order) {
        inventory.updateOrder(order)
        products = inventory.products
    }
    
    func getOrdersByProduct(_ product: Product) -> [Order] {
        orders.filter { $0.sku == product.sku }
    }
    
    func addWarehouse(_ warehouse: Warehouse) {
        inventory.addWarehouse(warehouse)
    }
}
