//
//  HomeView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/29/24.
//

import SwiftUI

struct HomeView: View {
    @State private var store = InventoryViewModel()
    @State private var selectedMenuItem: Menu? = Menu.products
    @State private var searchText = ""

    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            iphoneNavigationView
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            ipadNavigationView
        }
    }
    
    private var iphoneNavigationView: some View {
        TabView(selection: $selectedMenuItem) {
            NavigationStack {
                ProductListView()
                    .environment(store)
            }
            .tabItem { Label("Products", systemImage: "book") }
            .tag(Menu.products as Menu?)
                
            NavigationStack {
                OrderListView(orders: store.orders)
                    .environment(store)
            }
            .tabItem { Label("Orders", systemImage: "cube.box") }
            .tag(Menu.orders as Menu?)
            
            NavigationStack {
                WarehouseListView()
                    .environment(store)
            }
            .tabItem { Label("Warehouses", systemImage: "mappin.and.ellipse") }
            .tag(Menu.warehouses as Menu?)
            
            NavigationStack {
                CategoryListView()
                    .environment(store)
            }
            .tabItem { Label("Categories", systemImage: "square.grid.2x2") }
            .tag(Menu.categories as Menu?)
            
            NavigationStack {
                ProfileView()
            }
            .tabItem { Label("Profile", systemImage: "person.crop.circle") }
            .tag(Menu.profile as Menu?)
        }
    }
    
    @ViewBuilder
    private var ipadNavigationView: some View {
        NavigationSplitView {
            List(Menu.allCases, selection: $selectedMenuItem) { menuItem in
                Text(menuItem.rawValue.capitalized).tag(menuItem)
            }
            .navigationTitle("Inventix")
        } detail: {
            switch selectedMenuItem {
            case .products:
                ProductListView()
                    .environment(store)
            case .orders:
                OrderListView(orders: store.orders)
                    .environment(store)
                    .searchable(text: $searchText)
            case .warehouses:
                WarehouseListView()
                    .environment(store)
            case .categories:
                CategoryListView()
                    .environment(store)
            case .profile:
                ProfileView()
            default:
                Text("Select a menu")
            }
        }
    }
    
    enum Menu: String, CaseIterable, Identifiable {
        case products, orders, warehouses, categories, profile
        var id: String { self.rawValue }
    }
}

#Preview {
    HomeView()
}
