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
                .frame(maxWidth: 300, alignment: .center)
            Text(text)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    BarcodeView(text: "ABC-123")
}
