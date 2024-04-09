//
//  OrderDetailView.swift
//  Inventix
//
//  Created by Khanh Chung on 4/3/24.
//

import SwiftUI

struct OrderDetailView: View {
    @Environment(InventoryViewModel.self) private var store
    @State private var showEditOrder = false
    @State var order: Order
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    productInfo.listRowSeparator(.visible)
                    
                    // TODO fix style
                    NavigationLink {
                        ProductDetailView(product: store.getProductBySKU(order.sku)!)
                    } label: {
                        Text("View")
                            .labelStyle(.titleAndIcon)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Section("Action") {
                    if order.type == .move {
                        LabeledContent("\(order.type.rawValue.capitalized)d to") {
                            Text("\(store.getProductBySKU(order.sku)?.warehouse.name ?? "")")
                        }
                        LabeledContent("Date") {
                            Text(order.date, style: .date)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    } else {
                        LabeledContent(order.type.rawValue.capitalized) {
                            Text(order.date, style: .date)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                
                Section("Inventory Information") {
                    inventoryInfo
                }
                
                if !order.notes.isEmpty {
                    Section("Notes") {
                        Text(order.notes)
                    }
                }
                
                Section("Barcode") {
                    BarcodeView(text: order.sku)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showEditOrder) {
                NavigationStack {
                    EditOrderView(order: $order)
                }
            }
        }
    }
    
    @ViewBuilder
    private var productInfo: some View {
        let product = store.getProductBySKU(order.sku)!
        
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
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    @ViewBuilder
    private var inventoryInfo: some View {
        Group {
            LabeledContent("Quantity") {
                Text("\(order.stock) units")
            }
            
            LabeledContent("Product SKU") {
                Text("\(order.sku)")
            }
        }
    }
}

#Preview {
    OrderDetailView(order: Order.example[0])
        .environment(InventoryViewModel())
}
