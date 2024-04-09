//
//  Order.swift
//  Inventix
//
//  Created by Khanh Chung on 4/3/24.
//

import Foundation

struct Order: Identifiable {
    var sku: String
    var stock: Int
    var type: TypeAction
    var date: Date
    var notes: String = ""
    
    let id = UUID()
    
    enum TypeAction: String, Identifiable {
        case restock, move
        var icon: String {
            switch self {
            case .restock:
                "arrow.circlepath"
            case .move:
                "shippingbox.and.arrow.backward.fill"
            }
        }
        var id: String { self.rawValue }
    }
    
    static let empty = Order(sku: "ERO-921", stock: 0, type: .restock, date: Date())
    
    static let example = [
        Order(sku: "ERO-921", stock: 20, type: .restock, date: Date(), notes: "Urgent restock needed for popular items. Sales have been exceeding projections."),
        Order(sku: "ERO-CC1", stock: 600, type: .restock, date: Date())
    ]
}
