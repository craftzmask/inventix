//
//  HomeView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/29/24.
//

import SwiftUI
import CodeScanner

struct HomeView: View {
    @State private var store = InventoryViewModel()
    @State private var selectedMenuItem: Menu? = Menu.products
    @State private var searchText = ""
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    @State private var showAddProduct = false
    @State private var showRestock = false
    
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
                /*
                CodeScannerView(codeTypes: [.qr], shouldVibrateOnSuccess: false) { response in
                    if case let .success(result) = response {
                        scannedCode = result.string
                        isPresentingScanner = false
                    }
                }
                 */
                ScannerView()
                    .environment(store)
            }
            .tabItem { Label("Scan", systemImage: "qrcode.viewfinder") }
            .tag(Menu.scanner as Menu?)
            
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
            
            /*
            NavigationStack {
                ProfileView()
            }
            .tabItem { Label("Profile", systemImage: "person.crop.circle") }
            .tag(Menu.profile as Menu?)
             */
        }
    }
    
    @ViewBuilder
    private var ipadNavigationView: some View {
        NavigationSplitView {
            List(Menu.allCases, selection: $selectedMenuItem) { menuItem in
                Label(menuItem.rawValue.capitalized, systemImage: menuItem.icon)
                    .tag(menuItem)
            }
            .navigationTitle("Inventix")

        } detail: {
            switch selectedMenuItem {
            case .products:
                ProductListView()
                    .environment(store)
                    .searchable(text: $searchText)
            case .orders:
                OrderListView(orders: store.orders)
                    .environment(store)
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
        case products, orders, scanner, warehouses, categories, profile
        var icon: String {
            switch self {
            case .products:
                "book"
            case .orders:
                "cube.box"
            case .scanner:
                "qrcode.viewfinder"
            case .warehouses:
                "mappin.and.ellipse"
            case .categories:
                "square.grid.2x2"
            case .profile:
                "person.crop.circle"
            }
        }
        var id: String { self.rawValue }
    }
}

extension String: Identifiable {
    public var id: String { self }
}

#Preview {
    HomeView()
}
