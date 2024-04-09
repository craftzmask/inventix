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
        List(orders) { order in
            NavigationLink {
                OrderDetailView(order: order)
                    .environment(store)
            } label: {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text(order.sku)
                            .fontWeight(.semibold)
                        Text("+\(order.stock.description) (\(order.type.rawValue.capitalized))")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text(order.date, style: .date)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
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
