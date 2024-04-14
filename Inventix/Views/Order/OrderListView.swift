//
//  OrderListView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/30/24.
//

import SwiftUI

struct OrderListView: View {
    @Environment(InventoryViewModel.self) private var store
    @State private var searchText = ""
    var orders: [Order]
    
    var body: some View {
        let orders = store.filteredOrders(orders, searchText: searchText)
        
        List(orders) { order in
            if let product = store.getProductFromOrder(order) {
                NavigationLink {
                    OrderDetailView(order: order)
                        .environment(store)
                } label: {
                    let isAdded = order.stock > 0
                    
                    VStack(alignment: .leading) {
                        Text(product.name).fontWeight(.semibold)
                        HStack(alignment: .bottom) {
                            Text("\(isAdded ? "+" : "")\(order.stock) (\(order.action))").font(.subheadline).foregroundStyle(.secondary)
                            Spacer()
                            Text(order.date, style: .date)
                                .foregroundStyle(.secondary)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .navigationTitle("Order History")
        .searchable(text: $searchText)
    }
}

#Preview {
    NavigationStack {
        OrderListView(orders: Order.example)
            .environment(InventoryViewModel())
    }
}
