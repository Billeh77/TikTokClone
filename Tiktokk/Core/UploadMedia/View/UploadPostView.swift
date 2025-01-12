//
//  UploadPostView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/26/24.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var caption = ""
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                TextField("Enter your caption", text: $caption, axis: .vertical)
                
                Spacer()
                
                Image(systemName: "house")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 100)
                    .clipShape(.rect(cornerRadius: 10))
                
                    
            }
            
            Divider()
            
            Spacer()
            
            Button {
                print("Post")
            } label: {
                Text("Post")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(width: 352, height: 44)
                    .background(.pink)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    UploadPostView()
}
