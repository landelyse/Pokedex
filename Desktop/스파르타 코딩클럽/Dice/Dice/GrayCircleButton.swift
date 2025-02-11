//
//  GrayCircleButton.swift
//  Dice
//
//  Created by 박진홍 on 9/16/24.
//

import Foundation
import SwiftUI

struct GrayCircleButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        return configuration.label
            .frame(width: 35, height: 35)
            .foregroundStyle(.white)
            .background(Circle().opacity(0.3)
                .foregroundStyle(.white)
            )
            
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
//            .border(.black)
    }
}


