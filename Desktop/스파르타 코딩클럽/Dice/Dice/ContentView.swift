import SwiftUI

struct ContentView: View {
    @State private var someDice: Int = 0
    @State private var dice: [Int] = [1]
    private var diceSum: Int {
        var sum: Int = 0
        for num in dice {
            sum += num
        }
        return sum
    }
    
    var body: some View {
        ZStack{
            //배경
            Rectangle()
                .foregroundStyle(.backgroundBlue)
                .ignoresSafeArea()
            
            VStack{
                //앱 이름
                Text("Dice Roller")
                    .font(.largeTitle.lowercaseSmallCaps())
                    .foregroundStyle(.white)
                    .padding()
                //주사위 눈 합산
                VStack{
                    Text("Total Num")
                        .bold()
                        .foregroundStyle(.white)
                    
                }
                Text("\(diceSum)")
                .frame(width: 100, height: 25)
                .background(RoundedRectangle(cornerRadius: 8)
                    .opacity(0.25))
                .foregroundStyle(.white)

                //주사위
                HStack{
                    ForEach(0...someDice, id: \.self) {num in
                        VStack{
                            DiceView(someDice: $someDice, diceNum: $dice[num])
                            Button {
                                dice[num] = Int.random(in:1...6)
                            } label: {
                                Image(systemName: "arrow.counterclockwise")
                            }
                            .buttonStyle(GrayCircleButton())
                            
                        }
                    }
                }
                .frame(width:.infinity, height: 150)
                .padding(.horizontal)
//                .border(.black)
                
                //추가, 삭제 버튼
                HStack{
                    Button {
                        addDice()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(someDice == 5 ? .gray : .white)
                        
                    }
                    .buttonStyle(GrayCircleButton())
                    .padding(.trailing)
                    
                    
                    .buttonStyle(GrayCircleButton())
                }
//                .border(.black)
            }
            .frame(width: .infinity,height: 300)
//            .border(.purple)
            VStack{
                if someDice > 2 {
                    Button("reroll at once!") {
                        for num in 0..<dice.count {
                            dice[num] = Int.random(in: 1...6)
                        }
                    }
                    .offset(y: 200)
                    .padding()
                    .buttonStyle(PressedButton())
                  
//                    .border(.black)
                }
            }
//            .border(.purple)
        }
        
    }
    private func addDice() {
        if someDice < 5 {
            dice.append(1)
            someDice += 1
        } else if someDice == 5 {
            someDice = 5
        }
    }
    private func subDice() {
        if someDice > 0 {
            dice.removeLast()
            someDice -= 1
        } else if someDice == 0{
            someDice = 0
        }
    }
}




#Preview {
    ContentView()
}
