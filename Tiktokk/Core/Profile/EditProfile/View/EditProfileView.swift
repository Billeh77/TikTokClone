//
//  EditProfileView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var profileImage: Image?
    @State private var uiImage: UIImage?
    
    @StateObject var manager = EditProfileManager(imageUploader: ImageUploader())
    
    @Environment(\.dismiss) var dismiss
    
    let user: User
    
    var body: some View {
        
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedPickerItem, matching: .images) {
                    VStack {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: avatarSize.dimension, height: avatarSize.dimension)
                                .clipShape(Circle())
                        } else {
                            AvatarView(user: user, size: .large)
                        }
                        
                        Text("Change Photo")
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray2))
                        .fontWeight(.semibold)
                    
                    EditProfileOptionRowView(option: EditProfileOptions.name, value: user.fullName)
                    
                    EditProfileOptionRowView(option: EditProfileOptions.username, value: user.username)
                    
                    EditProfileOptionRowView(option: EditProfileOptions.bio, value: user.bio ?? "Add a bio")
                    
                }
                .font(.subheadline)
                .padding()
                
                Spacer()
            }
            .task(id: selectedPickerItem) {
                await loadImage(fromItem: selectedPickerItem)
            }
            .navigationDestination(for: EditProfileOptions.self) { option in
                EditProfileDetailView(option: option, user: user)
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        onDoneTapped()
                    } label: {
                        Text("Done")
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

private extension EditProfileView {
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func onDoneTapped() {
        Task {
            guard let uiImage else { return }
            await manager.uploadProfileImage(uiImage)
            dismiss()
        }
    }
    
    var avatarSize: AvatarSize {
        return .large
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.user)
}


