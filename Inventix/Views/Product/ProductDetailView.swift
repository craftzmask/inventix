//
//  ProductDetailView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/30/24.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(InventoryViewModel.self) private var store
    @State var product: Product
    @State private var showProductEditor = false
    @State private var deleteConfirm = false
    @State private var showRestock = false
    @State private var showMove = false
    @State private var showSale = false
    
    var body: some View {
        Form {
            Section("Product Information") {
                productInfo.listRowSeparator(.visible)
                actions
            }
            
            Button(role: .destructive) {
                deleteConfirm.toggle()
            } label: {
                Label("Delete", systemImage: "trash")
                    .labelStyle(.titleAndIcon)
                    .frame(maxWidth: .infinity)
            }
            .confirmationDialog("Are you sure to delete?", isPresented: $deleteConfirm) {
                Button("Delete", role: .destructive) {
                    store.removeProduct(product)
                    dismiss()
                }
                Button("Cancel", role: .cancel) {
                    deleteConfirm = false
                }
            } message: {
                Text("Are you sure to delete this product?")
            }
            
            Section("Invetory Information") {
                inventoryInfo
            }
            
            let result = store.getWarehouses(productId: product.id).sorted(by: { $0.key.name < $1.key.name } )
            if !result.isEmpty {
                Section("Warehouses") {
                    List(result, id: \.key) { warehouse, stock in
                        LabeledContent(warehouse.name) {
                            Text("\(stock) units")
                        }
                    }
                }
            }
            
            Section("Barcode") {
                BarcodeView(text: product.sku)
            }
            
            let orders = store.orders.filter { $0.productId == product.id }
            if !orders.isEmpty {
                Section("History") {
                    List(orders) { order in
                        if let product = store.getProductFromOrder(order) {
                            NavigationLink {
                                OrderDetailView(order: order)
                                    .environment(store)
                                    .navigationTitle("Order Detail")
                            } label: {
                                let isAdded = order.stock > 0
                                HStack(alignment: .bottom) {
                                    VStack(alignment: .leading) {
                                        Text(product.sku).fontWeight(.semibold)
                                        Text("\(isAdded ? "+" : "")\(order.stock) (\(order.action))").font(.subheadline).foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    Text(order.date, style: .date)
                                        .foregroundStyle(.secondary)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showProductEditor) {
            NavigationStack {
                EditProductView(product: $product)
            }
        }
        .sheet(isPresented: $showRestock) {
            NavigationStack {
                RestockView(product: $product)
            }
        }
        .sheet(isPresented: $showMove) {
            NavigationStack {
                MoveProductView(product: $product)
            }
        }
        .sheet(isPresented: $showSale) {
            NavigationStack {
                SaleView(product: $product)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showProductEditor.toggle()
                } label: {
                    Label("Edit", systemImage: "square.and.pencil")
                }
            }
        }
    }
    
    private var productInfo: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(product.sku)
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    @ViewBuilder
    private var actions: some View {
        VStack {
            Button {
                showRestock.toggle()
            } label: {
                Label("Restock", systemImage: "arrow.circlepath")
                    .labelStyle(.titleAndIcon)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                showSale.toggle()
            } label: {
                Label("Sale", systemImage: "dollarsign")
                    .labelStyle(.titleAndIcon)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                showMove.toggle()
            } label: {
                Label("Move", systemImage: "shippingbox.and.arrow.backward.fill")
                    .labelStyle(.titleAndIcon)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    @ViewBuilder
    private var inventoryInfo: some View {
        let quantity = store.getQuantity(productId: product.id)
        let indicatorColor = if quantity <= 0 {
            Color.red
        } else if quantity <= product.minStock {
            Color.orange
        } else {
            Color.secondary
        }
                                         
        Group {
            LabeledContent("Current Inventory") {
                Text("\(quantity) units")
                    .foregroundStyle(indicatorColor)
            }
            
            LabeledContent("Min. Stock Level") {
                Text("\(product.minStock) units")
            }
            
            if let category = store.getCategory(id: product.categoryId) {
                LabeledContent("Category") {
                    Text("\(category.name)")
                }
            }
            
            LabeledContent("Price") {
                Text(product.price, format: .currency(code: "USD"))
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(product: Product.example[0])
            .environment(InventoryViewModel())
    }
}
