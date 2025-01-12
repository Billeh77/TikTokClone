//
//  AvatarSize.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/26/24.
//

import Foundation

enum AvatarSize {
    case xxsmall
    case xsmall
    case small
    case medium
    case large
    case xlarge
    
    var dimension: CGFloat {
        switch self {
        case .xxsmall: return 28
        case .xsmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xlarge: return 80
        }
        
    }
}
