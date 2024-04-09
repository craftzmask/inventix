//
//  ProductDetailView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/30/24.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(InventoryViewModel.self) private var store
    @State var product: Product
    @State private var showProductEditor = false
    @State private var showRestock = false
    @State private var showMove = false
    
    // Usage example
    var body: some View {
        Form {
            Section("Product Information") {
                productInfo.listRowSeparator(.visible)
                actions
            }
            
            Section("Invetory Information") {
                inventoryInfo
            }
            
            Section("Barcode") {
                BarcodeView(text: product.sku)
            }
            
            Section {
                OrderListView(orders: store.getOrdersByProduct(product))
            } header: {
                Text("Order History").font(.title2)
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
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: store.products) { _, products in
            if let updatedProduct = products.first(where: { $0.id == product.id }) {
                product = updatedProduct
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
                showProductEditor.toggle()
            } label: {
                Label("Edit", systemImage: "pencil")
                    .labelStyle(.titleAndIcon)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Menu {
                Button {
                    showRestock.toggle()
                } label: {
                    Label("Restock", systemImage: "arrow.circlepath")
                        .labelStyle(.titleAndIcon)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    showRestock.toggle()
                } label: {
                    Label("Adjust", systemImage: "square.and.pencil")
                        .labelStyle(.titleAndIcon)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
            } label: {
                Label("Action", systemImage: "ellipsis.circle")
                    .frame(width: 10000)
            }
            .frame(width: .infinity)
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.white)
            
            Button {
                showMove.toggle()
            } label: {
                Label("Move", systemImage: "shippingbox.and.arrow.backward.fill")
                    .labelStyle(.titleAndIcon)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    private var inventoryInfo: some View {
        Group {
            LabeledContent("Warehouse") {
                Text("\(product.warehouse.name)")
            }
            
            LabeledContent("Current Inventory") {
                Text("\(product.stock) units")
            }
            
            LabeledContent("Min. Stock Level") {
                Text("\(product.minStock) units")
            }
            
            LabeledContent("Category") {
                Text("\(product.category.name)")
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
