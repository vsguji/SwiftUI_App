//
//  CategoryHome.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/27.
//

import SwiftUI

struct CategoryHome: View {
    
    var categories:[String:[Landmark]] {
        Dictionary(
            grouping:landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var featured:[Landmark] {
        landmarkData.filter({ $0.isFeatured })
    }
    
    @State var showingProfile = false
    
    @EnvironmentObject var userData:UserData
    
    // MARK : - 1
//    var body: some View {
//        NavigationView {
//            Text("lanmarks Content")
//                .navigationBarTitle(Text("Featured"))
//        }
//    }
    
    // MARK ： - 2
//    var body: some View {
//        NavigationView {
//            List { // 高度 :1.固定高度;2.自适应高度
//                ForEach(categories.keys.sorted(),id:\.self) { key in
//                    Text(key)
//                }
//            }
//            .navigationBarTitle(Text("Featured"))
//        }
//    }
    
    // MARK : - 3
    
    var profileButton : some View {
        
        Button(action:{self.showingProfile.toggle()}) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFit()
                    .frame(height:200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(),id:\.self) { key in
                    CategoryRow(categoryName:key,items:self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination:LandmarkList { LandmarkDetail(landmark: $0)}) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
//               Text("User Profile")
                ProfileHost().environmentObject(self.userData)
            }
        }
    }
}

struct FeaturedLandmarks:View {
    var landmarks:[Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
