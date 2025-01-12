//
//  UserStatsView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/22/24.
//

import SwiftUI

struct UserStatsView: View {
    let statValue: Int
    let statLabel: String
    
    var body: some View {
        VStack {
            Text("\(statValue)")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text(statLabel)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(width: 80, alignment: .center)
    }
}

#Preview {
    UserStatsView(statValue: 5, statLabel: "Following")
}
