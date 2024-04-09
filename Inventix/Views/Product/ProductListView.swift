//
//  ProductListView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/28/24.
//

import SwiftUI

struct ProductListView: View {
    @Environment(InventoryViewModel.self) private var store
    @State private var searchText = ""
    @State private var showAddProduct = false
    
    var body: some View {
        @Bindable var store = store
        
        ScrollView {
            VStack(spacing: 30) {
                ForEach(store.categories) { category in
                    let products = store.productsByCategory(category)
                    
                    VStack {
                        HStack {
                            Text(category.name)
                                .font(.title2)
                            Spacer()
                            NavigationLink {
                                VerticalProductListView(products: products)
                                    .navigationTitle(category.name)
                                    .environment(store)
                            } label: {
                                HStack(alignment: .center) {
                                    Text("See All")
                                    Image(systemName: "chevron.right")
                                        .imageScale(.small)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        .fontWeight(.semibold)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(products) { product in
                                    NavigationLink {
                                        ProductDetailView(product: product)
                                            .environment(store)
                                    } label: {
                                        ProductRowView(product)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                }
            }
        }
        .sheet(isPresented: $showAddProduct) {
            NavigationStack {
                AddProductView()
            }
        }
        .scrollIndicators(.hidden)
        .padding()
        .searchable(text: $searchText)
        .navigationTitle("Products")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showAddProduct.toggle()
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
    }
}

struct ProductRowView: View {
    let product: Product
    
    init(_ product: Product) {
        self.product = product
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                ProgressView()
            }
            
            Text(product.name)
                .fontWeight(.semibold)
            Text("\(product.stock) units")
                .foregroundStyle(.secondary)
                .font(.subheadline)
        }
        .frame(width: 160, height: 200)
    }
}

#Preview {
    NavigationStack {
        ProductListView()
            .environment(InventoryViewModel())
    }
}
