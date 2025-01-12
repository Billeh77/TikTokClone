//
//  EditProfileDetailView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import SwiftUI

struct EditProfileDetailView: View {
    
    @State private var value = ""
    @Environment(\.dismiss) var dismiss
    
    let option: EditProfileOptions
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                TextField("Add your bio", text: $value)
                
                Spacer()
                
                if !value.isEmpty {
                    Button {
                        value = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Divider()
            
            Text("Tell us a little bit about yourself")
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top, 8)
            
            Spacer()
        }
        .padding()
        .navigationTitle(option.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear { onViewAppear() }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("Save")
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

private extension EditProfileDetailView {
    var subtitle: String {
        switch option {
        case .name:
            "Your full name can only be changed once every 7 days"
        case .bio:
            "Tell us a little bit about yourself"
        case .username:
            "Usernames can only contain letters, numbers, underscores, and periods"
        }
    }
    
    func onViewAppear() {
        switch option {
        case .name:
            value = user.fullName
        case .bio:
            value = user.bio ?? ""
        case .username:
            value = user.username
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileDetailView(option: .username, user: DeveloperPreview.user)
            .tint(.primary)
    }
}
