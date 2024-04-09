//
//  BarcodeView.swift
//  Inventix
//
//  Created by Khanh Chung on 4/5/24.
//

import SwiftUI

struct BarcodeView: View {
    var text: String
    
    var body: some View {
        VStack(spacing: 0) {
            BarcodeGenerator().generateBarcode(text: text)
                .resizable()
                .scaledToFit()
            Text(text)
        }
    }
}

#Preview {
    BarcodeView(text: "ABC-123")
}
