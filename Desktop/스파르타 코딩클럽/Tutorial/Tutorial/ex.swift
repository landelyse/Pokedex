//
//  ex.swift
//  Tutorial
//
//  Created by 박진홍 on 9/15/24.
//

import SwiftUI

let testColor: [Color] = [
    .testPurple,
    .testOrange,
    .red
]
struct ex: View {
    
   
    
    var body: some View {
        ZStack{
//            LinearGradient(colors: [Color("Purple"), Color("Orange")], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            VStack{
//                RoundedRectangle(cornerRadius: 25)
//                    .stroke()
//                    .background(Gradient(colors: testColor))
                Text("Features")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .opacity(0.3)
                        .frame(width: .infinity, height: 100)
                    HStack{
                        Image("Coffee")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 200.0))
                            .padding()
                        
                        
                        Text("This is my coffe. \nThe art name is Rosetta. \nI practiced many times. ")
                            .font(.title3)
                        
                        
                    }
                    .foregroundStyle(.white)
                }
                .padding(.horizontal)
                //
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .opacity(0.3)
                        .frame(width: .infinity, height: 100)
                    HStack{
                        Image(systemName:"quote.bubble.fill")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .padding()
                        
                        Text("mich nicht umbright, macht mich stärker")
                            .font(.title3)
                        
                        
                        
                    }
                    .foregroundStyle(.white)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

#Preview {
    ex()
        .background(Gradient(colors: testColor))
}
