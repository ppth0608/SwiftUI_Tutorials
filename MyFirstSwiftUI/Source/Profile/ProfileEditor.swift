//
//  ProfileEditor.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/08/02.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI

struct ProfileEditor : View {
    
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField($profile.username, placeholder: Text("Username"))
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notification")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Sessonal Photo").bold()
                Picker(selection: $profile.seasonalPhoto, label: Text("aa")) {
                    ForEach(Profile.Season.allCases.identified(by: \.self)) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Goal Date").bold()
                DatePicker($profile.goalDate,
                           displayedComponents: .date) {
                            Text("Goal Date")
                }
            }
        }
    }
}

#if DEBUG
struct ProfileEditor_Previews : PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
#endif
