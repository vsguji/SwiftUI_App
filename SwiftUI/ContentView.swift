//
//  ContentView.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            
            MapView(coordinate: landmarkData[0].locationCoordinate)
            .edgesIgnoringSafeArea(.top)
            .frame(height:300)
            
            CircleImage(image: Image("me-bg-mydata"))
            .offset(y: -130)
            .padding(.bottom,-130)
        VStack(alignment:.leading){
            Text("Turtle Rock")
                .font(.title)
            HStack(alignment: .top){
                Text("Joshua Tree National Park")
                    .font(.subheadline)
            Spacer()
            Text("California")
                .font(.subheadline)
            }
         }
        .padding()
        Spacer() // 默认高度?
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
