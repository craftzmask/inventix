//
//  AddProductView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/29/24.
//

import SwiftUI
import PhotosUI

struct AddProductView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(InventoryViewModel.self) private var store
    
    @State private var name = ""
    @State private var description = ""
    @State private var selectedCategory: Category?
    @State private var price = 0
    @State private var sku = ""
    @State private var minStock = 0
    @State private var showAddCategory = false
    @State private var data: Data?
    @State var selectedItems: [PhotosPickerItem] = []
    
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
                    Text("Select").tag(Optional<Warehouse>(nil))
                    ForEach(store.categories) { category in
                        Text(category.name).tag(category as Category?)
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
                TextField("", value: $price, format: .currency(code: "USD"))
                    .keyboardType(.numberPad)
            } header: {
                HStack {
                    Text("Price")
                    Spacer()
                    Text("Required")
                }
            }
            
            Section {
                TextField("", text: $sku)
            } header: {
                HStack {
                    Text("SKU")
                    Spacer()
                    Text("Required")
                }
            }
            
            Section {
                TextField("", value: $minStock, format: .number)
                    .keyboardType(.numberPad)
            } header: {
                HStack {
                    Text("Min. Stock level")
                    Spacer()
                    Text("Required")
                }
            }
            
            Section {
                PhotosPicker(
                    selection: $selectedItems,
                    maxSelectionCount: 1,
                    matching: .images
                ) {
                    HStack {
                        if let data = data, let uiimage = UIImage(data: data) {
                            Image(uiImage: uiimage)
                                .resizable()
                                .scaledToFit()
                                .symbolRenderingMode(.multicolor)
                        } else {
                            Image(systemName: "photo")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 20))
                            Text("Choose a photo")
                        }
                    }
                    .foregroundColor(.secondary)
                }
                .onChange(of: selectedItems) {
                    guard let item = selectedItems.first else { return }
                    item.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let data):
                            if let data = data {
                                self.data = data
                            } else {
                                print("Data is nil")
                            }
                        case .failure(let failure):
                            fatalError("\(failure)")
                        }
                    }
                }
            } header: {
                HStack {
                    Text("Photo")
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
                    if let selectedCategory {
                        store.addProduct(Product(name: name, description: description, categoryId: selectedCategory.id, price: Decimal(price), sku: sku, minStock: minStock, imageUrl: ""))
                        dismiss()
                    }
                }
                .disabled(name.isEmpty || selectedCategory == nil || price <= 0 || sku.isEmpty || minStock <= 0)
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
