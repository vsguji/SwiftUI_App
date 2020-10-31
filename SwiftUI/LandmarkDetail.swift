//
//  LandmarkDetail.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/26.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var userData:UserData
    
    var landmark:Landmark
    
    var landmarkIndex:Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
//    var body: some View {  // Failed to produce diagnostic for expression; please file a bug report
//
//        VStack {
//            MapView(coordinate: landmark.locationCoordinate)
//                .edgesIgnoringSafeArea(.top)
//                .frame(height:300)
//
//            CircleImage(image: Image("me-bg-mydata"))
//                .offset(y:-120)
//                .padding(.bottom,-130)
//
//            VStack(alignment: .leading) {
//                Text("Turtle Rock")
//                    .font(.title)
//                HStack(alignment: .top) {
//                    Text("Joshua Tree National Park")
//                        .font(.subheadline)
//                    Spacer()
//                    Text("California")
//                        .font(.subheadline)
//                }
//            }
//            .padding()
//            Spacer()
//        }
//        .navigationBarTitle(landmark.name, displayMode: .inline)
//    }
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height:300)
            
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom,-130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Button(action:{
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }){
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        }
                        else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name),displayMode: .inline)
    }
    
}

struct LandmarkDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0]).environmentObject(UserData())
    }
}
