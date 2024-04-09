//
//  AddProductView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/29/24.
//

import SwiftUI

struct AddProductView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(InventoryViewModel.self) private var store
    
    @State var name = ""
    @State var description = ""
    @State var selectedCategory = Category.example[0]
    @State var showAddCategory = false
    
    var body: some View {
        @Bindable var store = store
        
        Form {
            Section {
                TextField("", text: $name)
            } header: {
                HStack {
                    Text("Name")
                    Spacer()
                    Text("Required")
                }
            }
            
            Section(header: Text("Description")) {
                TextEditor(text: $description)
                    .frame(height: 150)
            }

            Section {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(store.categories) { category in
                        Text(category.name).tag(category)
                    }
                }
                .pickerStyle(.navigationLink)
                
            } header: {
                HStack {
                    Text("Category")
                    Spacer()
                    Text("Required")
                }
            }
            
            Section {
                TextField("", text: $name)
            } header: {
                HStack {
                    Text("Price")
                    Spacer()
                    Text("Required")
                }
            }
            
            Section {
                TextField("", text: $name)
            } header: {
                HStack {
                    Text("SKU")
                    Spacer()
                    Text("Required")
                }
            }
            
            Section {
                TextField("", text: $name)
            } header: {
                HStack {
                    Text("Min. Stock level")
                    Spacer()
                    Text("Required")
                }
            }
        }
        .navigationTitle("Add Product")
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
                    dismiss()
                }
            }
        }
        .sheet(isPresented: $showAddCategory) {
            NavigationStack {
                AddCategoryView()
                    .environment(store)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddProductView()
            .environment(InventoryViewModel())
    }
}
