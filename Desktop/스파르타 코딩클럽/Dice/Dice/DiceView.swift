//
//  DiceView.swift
//  Dice
//
//  Created by 박진홍 on 9/16/24.
//

import SwiftUI
    
struct DiceView: View {
    @Binding var someDice: Int
    var diceSize: CGFloat {
        switch someDice {
        case 0...2: return 100
        case 3: return 73
        case 4: return 65
        case 5: return 55
        default: return 100
        }
    }
    
        
    @Binding var diceNum: Int
    
    var body: some View {
        VStack{
            Image(systemName: "die.face.\(diceNum).fill")
                
                .resizable()
                .foregroundStyle(.black, .white)
                .aspectRatio(1, contentMode: .fit)
//                .frame(minWidth: 50,idealWidth: diceSize,maxWidth: diceSize,minHeight:50,idealHeight: diceSize,maxHeight: diceSize)
        }
    }
}

#Preview {
    DiceView(someDice: .constant(4),diceNum: .constant(3))
}
