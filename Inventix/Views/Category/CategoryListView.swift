//
//  CategoryListView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/29/24.
//

import SwiftUI

struct CategoryListView: View {
    
    @Environment(InventoryViewModel.self) private var store
    
    @State private var searchText = ""
    
    @State private var showAddCategory = false
    
    var body: some View {
        List(store.categories) { category in
            NavigationLink {
                VerticalProductListView(products: store.productsByCategory(category))
                    .navigationTitle("Products")
                    .environment(store)
            } label: {
                VStack(alignment: .leading) {
                    Text(category.name)
                        .fontWeight(.semibold)
                    Text("\(store.productsByCategory(category).count) products")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .sheet(isPresented: $showAddCategory) {
            NavigationStack {
                AddCategoryView()
            }
        }
        .scrollIndicators(.hidden)
        .searchable(text: $searchText)
        .navigationTitle("Categories")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showAddCategory.toggle()
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        CategoryListView()
            .environment(InventoryViewModel())
    }
}
