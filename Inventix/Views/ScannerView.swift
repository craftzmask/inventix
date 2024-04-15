//
//  ScannerView.swift
//  Inventix
//
//  Created by Khanh Chung on 4/14/24.
//

import SwiftUI
import CodeScanner

struct ScannerView: View {
    @Environment(InventoryViewModel.self) private var store
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    @State private var showAddProduct = false
    @State private var showRestock = false

    var body: some View {
        Button {
            isPresentingScanner.toggle()
        } label: {
            VStack(spacing: 10) {
                Text("Tap to Scan")
                    .font(.title3)
                Image(systemName: "qrcode.viewfinder")
                    .font(.system(size: 100))
            }
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $isPresentingScanner) {
            CodeScannerView(codeTypes: [.qr]) { response in
                if case let .success(result) = response {
                    scannedCode = result.string
                    isPresentingScanner = false
                }
            }
        }
        .sheet(item: $scannedCode) { code in
            NavigationStack {
                if let product = store.products.first(where: { $0.sku == code }) {
                    RestockView(product: product)
                        .environment(store)
                } else if !code.isEmpty {
                    AddProductView(sku: code)
                        .environment(store)
                } else {
                    Text("Invalid Code")
                }
            }
        }
    }
}

#Preview {
    ScannerView()
        .environment(InventoryViewModel())
}
