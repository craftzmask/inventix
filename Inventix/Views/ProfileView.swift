//
//  ProfileView.swift
//  Inventix
//
//  Created by Khanh Chung on 4/5/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Form {
            Section("User Information") {
                LabeledContent("Name") {
                    Text("Khanh Chung")
                }
                
                LabeledContent("Email") {
                    Text("khanh.d.chung@gmail.com")
                }
            }
            
            Section("Business Information") {
                
                LabeledContent("Name") {
                    Text("Vegan Geo Donut")
                }
                
                LabeledContent("Type") {
                    Text("Restaurant")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
