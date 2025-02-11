//
//  Bubble.swift
//  Tutorial
//
//  Created by 박진홍 on 9/15/24.
//

import SwiftUI

struct Bubble: View {
    
    let iconName: String
    let description: String
    
    var body: some View {
        
        HStack{
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing)
            Text(description)
            Spacer()
        }
        .padding()
        .foregroundStyle(.white)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(.tint)
            .opacity(0.2)
            .brightness(-0.4))
        
        
        
    }
}

#Preview {
    Bubble(iconName:"person.2.crop.square.stack.fill", description: "its sunnyday")
           }
