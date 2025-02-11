//
//  Feed.swift
//  Game
//
//  Created by 박진홍 on 9/26/24.
//

import SwiftUI
import SwiftData

struct FeedButton: View {
    @Binding var animal: Character
    @State private var isWorkoutSelected: Bool = true
    @State private var isDetailWorkoutSelected: Bool = false
    
    var body: some View {
        ZStack {
                Button() {
                    withAnimation{
                        isWorkoutSelected.toggle()
                        isDetailWorkoutSelected.toggle()
                    }
                    
                } label: {
                    Text("🍽️")
                        .font(.title)
                        .frame(width:30, height: 30)
                        .foregroundStyle(.black)
                        .padding()
                }
                .buttonStyle(PopUpButtonStyle(isSelected: $isWorkoutSelected))
                VStack {
                    HStack{
                        Button() {
                            withAnimation{
                                isWorkoutSelected.toggle()
                                isDetailWorkoutSelected.toggle()
                                foods["Banana"]?.doFeed(animal: animal)
                            }
                        } label: {
                            Text("🍌")
                                .font(.title)
                                .frame(width:30, height: 30)
                                .foregroundStyle(.black)
                                
                        }
                        .buttonStyle(PopUpButtonStyle(isSelected: $isDetailWorkoutSelected,color: .orange))
                       
                        Button() {
                            withAnimation{
                                isWorkoutSelected.toggle()
                                isDetailWorkoutSelected.toggle()
                                foods["Burger"]?.doFeed(animal: animal)
                            }
                        } label: {
                            Text("🍔")
                                .font(.title)
                                .frame(width:30, height: 30)
                                .foregroundStyle(.black)
                                
                        }
                        .buttonStyle(PopUpButtonStyle(isSelected: $isDetailWorkoutSelected,color: .orange))
                    }
                    HStack{
                        Button() {
                            withAnimation{
                                isWorkoutSelected.toggle()
                                isDetailWorkoutSelected.toggle()
                                foods["Bab"]?.doFeed(animal: animal)
                            }
                        } label: {
                            Text("🍚")
                                .font(.title)
                                .frame(width:30, height: 30)
                                .foregroundStyle(.black)
                                
                        }
                        .buttonStyle(PopUpButtonStyle(isSelected: $isDetailWorkoutSelected,color: .orange))
                        Button() {
                            withAnimation{
                                isWorkoutSelected.toggle()
                                isDetailWorkoutSelected.toggle()
                                foods["Chicken"]?.doFeed(animal: animal)
                            }
                        } label: {
                            Text("🍗")
                                .font(.title)
                                .frame(width:30, height: 30)
                                .foregroundStyle(.black)
                                
                        }
                        .buttonStyle(PopUpButtonStyle(isSelected: $isDetailWorkoutSelected,color: .orange))
                    }
                }
                
            
        }
    }
}


#Preview {
    FeedButton(animal: .constant(characters[0]))
}
