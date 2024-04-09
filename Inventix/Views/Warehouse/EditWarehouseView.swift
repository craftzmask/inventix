//
//  EditWarehouseView.swift
//  Inventix
//
//  Created by Khanh Chung on 3/29/24.
//

import SwiftUI

struct EditWarehouseView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var s = ""
    
    var body: some View {
        Form {
            Section {
                TextField("", text: $s)
            } header: {
                HStack {
                    Text("Name")
                    Spacer()
                    Text("Required")
                }
            }
        }
        .navigationTitle("Edit Warehouse")
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
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    EditWarehouseView()
}
