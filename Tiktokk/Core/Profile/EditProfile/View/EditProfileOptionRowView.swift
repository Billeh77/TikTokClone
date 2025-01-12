//
//  EditProfileOptionRowView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    let option: EditProfileOptions
    let value: String
    var body: some View {
        NavigationLink(value: option) {
            Text(option.title)
            
            Spacer()
            
            Text(value)
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    EditProfileOptionRowView(option: .username, value: "lewis.hamilton")
}
