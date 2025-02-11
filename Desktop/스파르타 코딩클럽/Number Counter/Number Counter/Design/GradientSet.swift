/*
 public static var lairDiagonalDarkBorder: LinearGradient {
   LinearGradient(
     gradient: Gradient(colors: [.white, .lairGray]),
     startPoint: UnitPoint(x: -0.2, y: 0.5),
     endPoint: .bottomTrailing
   )
 }
 */
import SwiftUI

extension LinearGradient {
    public static var mainGradient = LinearGradient(
        gradient: Gradient(colors: [.white, Color("DarkGreen")]),
        startPoint: UnitPoint(x: -0.2, y: 0.5),
        endPoint: .bottomTrailing
    )
}
