//
//  ContentView.swift
//  miniProject
//
//  Created by 박진홍 on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            YellowView(textCounts: (1, 1))
            YellowView(textCounts: (3, 2))
        }
    }
}

struct YellowView: View {
    let textCounts: (Int, Int)
    @State private var verticalPaddingSize: CGFloat = 20
    
    var body: some View {
        
        HStack(alignment: (verticalPaddingSize == 20 ? .top : .center)) {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .border(.blue)
                
                TextView(helloCount: textCounts.0, worldCount: textCounts.1)
                    .overlay(GeometryReader { geometry in // background와의 차이점 알아보기
                        Color.clear
                            .onAppear {
                                if geometry.size.height > 80 {
                                    self.verticalPaddingSize = 10
                                }
                            }
                        // .onChange를 넣어주면 생기는 차이점 알아보기
                    })
                    .border(.pink)
                
            }
        .padding(.vertical, verticalPaddingSize)
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.yellow)
    }
}

struct TextView: View {
    let helloCount: Int
    let worldCount: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack {
                ForEach(0..<helloCount, id: \.self) { _ in
                    Text("Hello")
                        .foregroundStyle(.blue)
                }
            }
            
            VStack {
                ForEach(0..<worldCount, id: \.self) { _ in
                    Text("World")
                }
            }
        }
    }
}

//삼항연산자가 너무 더 쉬운 거 같아서 중간에 갈아탓슴니다,,,,,
extension VerticalAlignment {
    /// A custom alignment for image titles.
    private struct ImageTitleAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            // Default to bottom alignment if no guides are set.
            context[VerticalAlignment.top]// 위로 정렬을 위해 top으로 변경
        }
    }


    /// A guide for aligning titles.
    static let imageTitleAlignmentGuide = VerticalAlignment(
        ImageTitleAlignment.self
    )
}

#Preview {
    ContentView()
}


