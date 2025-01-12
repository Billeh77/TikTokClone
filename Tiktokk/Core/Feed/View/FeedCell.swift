//
//  FeedCell.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/22/24.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    
    @State private var isPaused = false
    
    let post: Post
    var player: AVPlayer
    
    init(post: Post, player: AVPlayer) {
        self.post = post
        self.player = player
    }
        
    var body: some View {
        ZStack {
            ZStack {
                CustomVideoPlayer(player: player)
                    .containerRelativeFrame([.horizontal, .vertical])
                
                VStack {
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text("carlos.sainz")
                                .fontWeight(.semibold)
                            
                            Text("Rocket ship preparing for take off")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        
                        Spacer()
                        
                        VStack(spacing: 28) {
                            
                            Circle()
                                .frame(width: 48, height: 48)
                                .foregroundStyle(.gray)
                            
                            
                            Button {
                                
                            } label: {
                                
                                VStack {
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundStyle(.white)
                                    
                                    Text("27")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                            }
                            
                            Button {
                                
                            } label: {
                                VStack {
                                    Image(systemName: "ellipsis.bubble.fill")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundStyle(.white)
                                    
                                    Text("5")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "bookmark.fill")
                                    .resizable()
                                    .frame(width: 22, height: 28)
                                    .foregroundStyle(.white)
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "arrowshape.turn.up.right.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, 90)
                }
                
            }
            .onTapGesture {
                switch player.timeControlStatus {
                case .paused:
                    player.play()
                    isPaused = false
                case .waitingToPlayAtSpecifiedRate:
                    break
                case .playing:
                    player.pause()
                    isPaused = true
                @unknown default:
                    break
                }
            }
            
            if isPaused {
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    FeedCell(post: Post(id: NSUUID().uuidString, videoUrl: ""), player: AVPlayer())
}
