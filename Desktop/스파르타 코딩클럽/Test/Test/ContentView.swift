//
//  ContentView.swift
//  Test
//
//  Created by 박진홍 on 2/5/25.
//

import SwiftUI

struct TestView: View {
    @State var isClicked: Bool = false
    
    var body: some View {
        ZStack {
            
            VStack {
                Button {
                    isClicked.toggle()
                } label: {
                    Text("Tap!")
                }
                
                HStack {
                    Image(isClicked ? "Test3" : "Test4")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(isClicked ? "Test1" : "Test2")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(isClicked ? "Test7" : "Test8")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(isClicked ? "Test5" : "Test6")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    
                }
                .background(Color(red: 0.8196, green: 0.7216, blue: 0.6588, opacity: 1))
            }
        }
        .background(Color(red: 248/255, green: 237/255, blue: 227/255, opacity: 1))
    }
}


#Preview {
    TestView(isClicked: false)
}
