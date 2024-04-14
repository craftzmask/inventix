//
//  ImageView.swift
//  Inventix
//
//  Created by Khanh Chung on 4/14/24.
//

import SwiftUI

struct ImageView: View {
    let url: String
    let size: CGFloat
    
    var body: some View {
        if url.starts(with: "https") {
            AsyncImage(url: URL(string: url)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                ProgressView()
            }
            .frame(width: size, height: size)
        } else {
            Image(url)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    VStack {
        ImageView(url: Product.example[0].imageUrl, size: 100)
        ImageView(url: "car", size: 50)
    }
}
