//
//  GraphCapsule.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/27.
//

import SwiftUI

struct GraphCapsule: View {
    
    var index:Int
    
    var height:CGFloat
    
    var range:Range<Double>
    
    var overallRange:Range<Double>
    
    var heightRatio:CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }
    
    var offsetRatio:CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }
    
    var body: some View {
        /// 在视图框架内对齐的胶囊形状。
        ///
        ///一个胶囊形状相当于一个圆角矩形，其中角的半径
        ///被选为矩形最小边长度的一半。
        Capsule()
            .fill(Color.white)
            .frame(height:height * heightRatio)
            .offset(x:0,y:height * -offsetRatio)
    }
}

