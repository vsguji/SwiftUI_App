//
//  CircleImage.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/26.
//

import SwiftUI

struct CircleImage: View {
    
    var image:Image
    
    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white,lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
//    Image("me-bg-mydata")
//    static var previews: some View {
//        CircleImage()
//    }
    static var previews: some View {
        CircleImage(image: Image("me-bg-mydata"))
    }
}
