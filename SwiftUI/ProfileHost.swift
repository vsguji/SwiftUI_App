//
//  ProfileHost.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/26.
//

import SwiftUI

struct ProfileHost: View {

    @Environment(\.editMode) var mode
    @EnvironmentObject var userData:UserData
    @State var draftProfile = Profile.default
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: draftProfile)
            }
            else {
//                Text("Profile Editor")
                
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
