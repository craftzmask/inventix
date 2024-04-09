//
//  MoveProductView.swift
//  Inventix
//
//  Created by Khanh Chung on 4/5/24.
//

import SwiftUI

struct MoveProductView: View {
    @Environment(InventoryViewModel.self) private var store
    @Environment(\.dismiss) private var dismiss
    @Binding var product: Product
    @State var order = Order(sku: "", stock: 0, type: .move, date: Date())

    var body: some View {
        Form {
            Section("Name") {
                Text(product.name)
            }
            
            Section {
                DatePicker(
                    "Start Date",
                    selection: $order.date,
                    displayedComponents: [.date]
                )
            } header: {
                HStack {
                    Spacer()
                    Text("Required")
                }
            }
            
            Section {
                Picker("To", selection: $product.warehouse) {
                    ForEach(store.warehouses) { warehouse in
                        if warehouse.id != product.warehouse.id {
                            Text(warehouse.name).tag(warehouse)
                        }
                    }
                }
                .pickerStyle(.navigationLink)
            } header: {
                HStack {
                    Text("Warehouse")
                    Spacer()
                    Text("Required")
                }
            }
            
            Section(header: Text("Notes")) {
                TextEditor(text: $order.notes)
                    .frame(height: 150)
            }
        }
        .navigationTitle("Move Product")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
                .foregroundStyle(.red)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    order.sku = product.sku
                    store.moveOrder(order)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MoveProductView(product: .constant(Product.example[0]))
            .environment(InventoryViewModel())
    }
}
