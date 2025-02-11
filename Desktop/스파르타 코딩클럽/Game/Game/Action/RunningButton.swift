import SwiftUI

struct RunningButton: View {
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
                Image(systemName: "dumbbell")
                    .font(.largeTitle)
                    .frame(width:30, height: 30)
                    .foregroundStyle(.secondary)
                    .padding()
                    
            }
            .buttonStyle(PopUpButtonStyle(isSelected: $isWorkoutSelected))
            
            
            VStack {
                HStack{
                    Button() {
                        withAnimation{
                            isWorkoutSelected.toggle()
                            isDetailWorkoutSelected.toggle()
                            workouts["Running"]?.doWorkout(animal: animal)
                        }
                    } label: {
                        Image(systemName:"figure.run")
                            .font(.largeTitle)
                            .frame(width:30, height: 30)
                            .foregroundStyle(.black)
                            
                    }
                    .buttonStyle(PopUpButtonStyle(isSelected: $isDetailWorkoutSelected,color: .red))
                   
                    Button() {
                        withAnimation{
                            isWorkoutSelected.toggle()
                            isDetailWorkoutSelected.toggle()
                            workouts["Swimming"]?.doWorkout(animal: animal)
                        }
                    } label: {
                        Image(systemName:"figure.pool.swim")
                            
                            .font(.largeTitle)
                            .frame(width:30, height: 30)
                            .foregroundStyle(.black)
                            .border(.blue)
                            
                    }
                    .buttonStyle(PopUpButtonStyle(isSelected: $isDetailWorkoutSelected,color: .red))
                }
                HStack{
                    Button() {
                        withAnimation{
                            isWorkoutSelected.toggle()
                            isDetailWorkoutSelected.toggle()
                            workouts["Cycling"]?.doWorkout(animal: animal)
                        }
                    } label: {
                        Image(systemName:"figure.outdoor.cycle")
                            .font(.largeTitle)
                            .frame(width:30, height: 30)
                            .foregroundStyle(.black)
                            
                    }
                    .buttonStyle(PopUpButtonStyle(isSelected: $isDetailWorkoutSelected,color: .red))
                    Button() {
                        withAnimation{
                            isWorkoutSelected.toggle()
                            isDetailWorkoutSelected.toggle()
                            workouts["Push-Up"]?.doWorkout(animal: animal)
                        }
                    } label: {
                        Image(systemName:"figure.cross.training")
                            .font(.largeTitle)
                            .frame(width:30, height: 30)
                            .foregroundStyle(.black)
                            
                    }
                    .buttonStyle(PopUpButtonStyle(isSelected: $isDetailWorkoutSelected,color: .red))
                }
            }
            
        }       
    }
}

#Preview {
    RunningButton(animal: .constant(characters.first!))
}
