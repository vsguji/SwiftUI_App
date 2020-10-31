//
//  Badge.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/26.
//

import SwiftUI

struct Badge: View {
    
//    var body: some View {
        
//        Path { path in
//            let width:CGFloat = 100.0
//            let height = width
//            path.move(to: CGPoint(x: width * 0.95, y: height * 0.20))
//            HexagonParameters.points.forEach {
//                path.addLine(to: .init(x: width * $0.useWidth.0 * $0.xFactors.0, y: height * $0.useHeight.0 * $0.yFactors.0))
//
//                path.addQuadCurve(to:.init(x: width * $0.useWidth.1 * $0.xFactors.1,
//                                           y: height * $0.useHeight.1 * $0.yFactors.1),
//                                  control: .init(x: width * $0.useWidth.2 * $0.xFactors.2,
//                                                 y: height * $0.useHeight.2 * $0.yFactors.2
//                                  )
//                )
//            }
//        }
//        .fill(Color.black)
        
        
        // MARK : - 2
//
//        Path { path in
//            var width:CGFloat = 100.0
//            let height = width
//            path.move(to: .init(x: width * 0.95,
//                                y: height * (0.20 + HexagonParameters.adjustment))
//            )
//
//            HexagonParameters.points.forEach {
//                path.addLine(to: .init(x: width * $0.useWidth.0 * $0.xFactors.0,
//                                       y: height * $0.useHeight.0 * $0.yFactors.0))
//
//
//                path.addQuadCurve(to: .init(x: width * $0.useWidth.1 * $0.xFactors.1,
//                                            y: height * $0.useHeight.1 * $0.yFactors.1),
//                                  control: .init(x: width * $0.useWidth.1 * $0.xFactors.1,
//                                                 y: height * $0.useHeight.1 * $0.yFactors.1)
//                )
//            }
//        }
//        .fill(Color.black)
//    }
        
     // MARK : - 3
        
//        GeometryReader { geometry in
//
//        Path { path in
//            var width:CGFloat = min(geometry.size.width, geometry.size.height)
//            let height = width
//            let xScale:CGFloat = 0.832
//            let xOffset = (width * (1.0 - xScale)) / 2.0
//            width *= xScale
//            path.move(to: .init(x: xOffset + width * 0.95,
//                                y: height * (0.20 + HexagonParameters.adjustment))
//            )
//
//            HexagonParameters.points.forEach {
//                path.addLine(to: .init(x: width * $0.useWidth.0 * $0.xFactors.0,
//                                       y: height * $0.useHeight.0 * $0.yFactors.0))
//
//
//                path.addQuadCurve(to: .init(x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
//                                            y: height * $0.useHeight.1 * $0.yFactors.1),
//                                  control: .init(x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
//                                                 y: height * $0.useHeight.2 * $0.yFactors.2)
//                )
//            }
//        }
////        .fill(Color.black)
//        .fill(LinearGradient(gradient: .init(colors: [Badge.gradientStart,Badge.gradientEnd]),
//                             startPoint: .init(x: 0.5, y: 0),
//                             endPoint: .init(x: 0.5, y: 0.6))
//            ).aspectRatio(1, contentMode: .fit)
//     }
//   }
//
//    static let gradientStart = Color(red:239.0 / 255, green:120.0 / 255, blue:221.0 / 255)
//    static let gradientEnd = Color(red:239.0 / 255,green:172.0 / 255, blue:120.0 / 255)
        
      // MARK: - 4
//        BadgeBackground()
        
       // MARK: - 5
        static let rotationCount = 8
    
        var  badgeSymbols: some View {
            ForEach (0..<Badge.rotationCount) { i in
                RotatedBadgeSymbol(angle: .init(degrees: Double(i) / Double(Badge.rotationCount)) * 360.0)
                    .opacity(0.5)
            }
        }
        
        var body:some View {
            ZStack {
                BadgeBackground()
                GeometryReader { geometry in
                    self.badgeSymbols
                        .scaleEffect(1.0 / 4.0,anchor: .top)
                        .position(x:geometry.size.width / 2.0,y:(3.0 / 4.0) * geometry.size.height)
                }
            }
            .scaledToFit()
        }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
