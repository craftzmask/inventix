//
//  RestockView.swift
//  Inventix
//
//  Created by Khanh Chung on 4/3/24.
//

import SwiftUI

struct RestockView: View {
    @Environment(InventoryViewModel.self) private var store
    @Environment(\.dismiss) private var dismiss
    @Binding var product: Product
    @State var order = Order(sku: "", stock: 0, type: .restock, date: Date())

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
                TextField("Units", value: $order.stock, format: .number)
                    .keyboardType(.numberPad)
            } header: {
                HStack {
                    Text("Quantity")
                    Spacer()
                    Text("Required")
                }
            }
            
            Section(header: Text("Notes")) {
                TextEditor(text: $order.notes)
                    .frame(height: 150)
            }
        }
        .navigationTitle("Restock")
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
                    store.restock(order)
                    product.stock += order.stock
                    dismiss()
                }
                .disabled(order.stock <= 0)
            }
        }
    }
}

#Preview {
    NavigationStack {
        RestockView(product: .constant(Product.example[0]))
            .environment(InventoryViewModel())
    }
}
