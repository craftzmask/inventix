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
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: "https://res.cloudinary.com/glide/image/fetch/t_media_lib_thumb/https%3A%2F%2Fstorage.googleapis.com%2Fglide-prod.appspot.com%2Fuploads-v2%2FYGvI36VoQe5mJNelMBS1-template-builder%2Fpub%2F8ijk5Xchy5qkOz4fHEy6.png")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } placeholder: {
                        ProgressView()
                    }
                    VStack(alignment: .leading) {
                        Text("Elise Beverley")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(verbatim: "elise@example.com")
                            .foregroundStyle(.gray)
                    }
                }
            }
            
            Section("Settings") {
                Toggle("Daily Expired Reminder", isOn: $store.isScheduled)
                
                if store.isScheduled {
                    DatePicker("", selection: $store.timeScheduled, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                }
            }
            
            Button("Sign out", role: .destructive) {
                
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
