//
//  AddWarehouseView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/29/24.
//

import SwiftUI

struct AddWarehouseView: View {
    @Environment(InventoryViewModel.self) private var store
    @Environment(\.dismiss) private var dismiss
    
    @State private var warehouse = Warehouse.empty
    
    var body: some View {
        Form {
            Section {
                TextField("", text: $warehouse.name)
            } header: {
                HStack {
                    Text("Name")
                    Spacer()
                    Text("Required")
                }
            }
            
            Section {
                TextEditor(text: $warehouse.address)
                    .frame(height: 100)
            } header: {
                HStack {
                    Text("Address")
                    Spacer()
                    Text("Required")
                }
            }
        }
        .navigationTitle("Add Warehouse")
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
                    store.addWarehouse(warehouse)
                    dismiss()
                }
                .disabled(warehouse.name.isEmpty && warehouse.address.isEmpty)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddWarehouseView()
            .environment(InventoryViewModel())
    }
}
