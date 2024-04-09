//
//  WarehouseListView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/29/24.
//

import SwiftUI
import MapKit

struct WarehouseListView: View {
    @Environment(InventoryViewModel.self) private var store

    @State private var searchText = ""
    @State private var showAddWarehouse = false
    @State private var showEditWarehouse = false
    @State private var showAddProduct = false
    
    var body: some View {
        List {
            Section {
                Map() {
                    ForEach(store.warehouses) { warehouse in
                        if let latitude = warehouse.latitude, let longitude = warehouse.longitude {
                            Marker(warehouse.name,
                                coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                            )
                        }
                    }
                }
                .frame(
                    height: UIDevice.current.userInterfaceIdiom == .phone ? 300 : .infinity
                )
            }
            
            ForEach(store.warehouses) { warehouse in
                NavigationLink {
                    VerticalProductListView(products: store.productsByWarehouse(warehouse))
                        .environment(store)
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
                } label: {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text(warehouse.name)
                                .fontWeight(.semibold)
                            Text(warehouse.address)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Button {
                            showEditWarehouse.toggle()
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.large)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .listStyle(.plain)
        .sheet(isPresented: $showAddWarehouse) {
            NavigationStack {
                AddWarehouseView()
                    .environment(store)
            }
        }
        .sheet(isPresented: $showEditWarehouse) {
            NavigationStack {
                EditWarehouseView()
                    .environment(store)
            }
        }
        .sheet(isPresented: $showAddProduct) {
            NavigationStack {
                AddProductView()
                    .environment(store)
            }
        }
        .scrollIndicators(.hidden)
        .searchable(text: $searchText)
        .navigationTitle("Warehouses")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showAddWarehouse.toggle()
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
        .onAppear {
            for (index, warehouse) in store.warehouses.enumerated() {
                let geocoder = CLGeocoder()
                geocoder.geocodeAddressString(warehouse.address) { placemarks, error in
                    guard let placemark = placemarks?.first, let location = placemark.location else {
                        print("Error geocoding address:", error ?? "Unknown error")
                        return
                    }
                    store.warehouses[index].latitude = location.coordinate.latitude
                    store.warehouses[index].longitude = location.coordinate.longitude
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        WarehouseListView()
            .environment(InventoryViewModel())
    }
}
