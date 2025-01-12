//
//  StandardTextFieldModifier.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/24/24.
//

import Foundation
import SwiftUI

struct StandardTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
