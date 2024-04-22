//
//  ProfileView.swift
//  Inventix
//
//  Created by Khanh Chung on 4/5/24.
//

import SwiftUI

struct ProfileView: View {
    @Environment(InventoryViewModel.self) private var store
    
    var body: some View {
        @Bindable var store = store
        
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
            
            Section("Settings") {
                Toggle("Daily Reminder", isOn: $store.isScheduled)
                
                if store.isScheduled {
                    DatePicker("", selection: $store.timeScheduled, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                }
            }
        }
        .onChange(of: store.timeScheduled) {
            UserDefaults.standard.set(store.timeScheduled.timeIntervalSince1970, forKey: "timeScheduled")
        }
    }
}

#Preview {
    ProfileView()
        .environment(InventoryViewModel())
}
