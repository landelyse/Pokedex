//
//  PressedButton.swift
//  Dice
//
//  Created by 박진홍 on 9/17/24.
//

import Foundation
import SwiftUI

struct PressedButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        return configuration.label
            .frame(width: 125,height: 25)
            .background(RoundedRectangle(cornerRadius: 8)
                .opacity(0.25))
            .foregroundStyle(.white)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
//            .border(.black)
    }
}
