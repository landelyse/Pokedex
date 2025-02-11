

import SwiftUI

struct FirstView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("Purple"), Color("Orange")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()//위 아래 safeArea까지 색으로 채우기 위함
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 150, height: 150)
                        .foregroundStyle(.tint)
                    Image(systemName: "figure.2.and.child.holdinghands")
                        .resizable()
                        .frame(width: 100, height: 75)
                        .foregroundStyle(.white)
                }
                Text("Welcome to my App")
                    .font(.title)
                    .bold()
                Text("this is my test App")
            }
            
        }
        
    }
    
}

#Preview {
    FirstView()
}
