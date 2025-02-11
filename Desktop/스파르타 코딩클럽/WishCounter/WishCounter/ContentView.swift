import SwiftUI
import SwiftData
import UIKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var countedNum: Int = 0
    

    var body: some View {
        VStack{
            VStack{
                Spacer()
                Text("Wish Counter")
                    .font(.largeTitle.lowercaseSmallCaps())
                    .fontWeight(.bold)
                    .foregroundStyle(Color("ButtonColor"))
                    
                    
                Button() {
                    countedNum += 1
                } label: {
                    Text("\(countedNum)")
                        .padding()
                        .frame(minWidth: 10,idealWidth: .infinity, maxWidth: .infinity,maxHeight: 300)
                        .foregroundStyle(Color("BackgroundColor"))
                        .background(
                            Circle()
//                                .stroke(lineWidth: 5)
                                
                                .foregroundStyle(Color("ButtonColor"))
                        )
                        .font(.system(size:500))
                        .minimumScaleFactor(0.001)
                        .shadow(color: .white.opacity(0.9),
                                radius: 5,
                                x: -2,
                                y: -2)
                        .shadow(color: .gray.opacity(0.5),
                                radius: 5,
                                x: 2,
                                y: 2)
                       
                        
                }
               
//                .border(.pink)
                HStack{
                    Button(){
                        countedNum = 0
                    } label: {
                        Image(systemName:"arrow.counterclockwise.circle")
                            .frame(width: 75, height: 75)
                            .font(.system(size:75).bold())
                            .multilineTextAlignment(.center)
                            .padding()
                            .foregroundStyle(Color("ButtonColor"))
//                            .border(.pink)
                            
                    }
                    
                    Button() {
                        addItem()
                        countedNum = 0
                    } label: {
                        Image(systemName: "arrow.down.circle")
                            .frame(width: 75, height: 75)
                            .font(.system(size:75).bold())
                            .multilineTextAlignment(.center)
                            .padding()
                            .foregroundStyle(Color("ButtonColor"))
//                            .border(.pink)
                    }
                    
                }
            }
            List() {
                ForEach(items.sorted(by: {$0.timestamp > $1.timestamp}), id: \.self) { item in
                    HStack{
                        Spacer()
                        Button(){
                            withAnimation {
                                deleteItems(offsets: IndexSet(integer: items.firstIndex(of: item) ?? 0))
                            }
                        }label:{Text("\(item.countedNum)")
                                
                                
                        }
                        .buttonStyle(PushedButtonStyle())
                        Spacer()
                        
                    }
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
            }
            
            .listStyle(.plain)
            .frame(maxHeight: 200)
            .background(Color("BackgroundColor"))
        }
        .frame(width: .infinity, height: .infinity)
        .background(Color("BackgroundColor"))
       
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(countedNum: countedNum, timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    
    struct PushedButtonStyle: ButtonStyle {
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 50, height: 50)
                .font(.system(size: 30).bold())
                .minimumScaleFactor(0.001)
                .foregroundStyle(Color("BackgroundColor"))
                .background(
                    Circle()
                        .foregroundStyle(configuration.isPressed ? Color.red.opacity(0.2) : Color("ButtonColor"))
                )
                .scaleEffect(configuration.isPressed ? 0.9 : 1)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
