//
//  BarcodeGenerator.swift
//  Inventix
//
//  Created by Khanh Chung on 4/5/24.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct BarcodeGenerator {
    let context = CIContext()
    let generator = CIFilter.code128BarcodeGenerator()

    func generateBarcode(text: String) -> Image {
        let generator = CIFilter.code128BarcodeGenerator()
        generator.message = Data(text.utf8)
        
        let transform = CGAffineTransform(scaleX: 5, y: 5)
        if let outputImage = generator.outputImage?.transformed(by: transform),
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {

            let uiImage = UIImage(cgImage: cgImage)

            return Image(uiImage: uiImage)
        }

        return Image(systemName: "barcode")
    }
}
