//
//  LandmarkList.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/06/04.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    /*
     State is a value, or a set of values, that can change over time, and that affects a view’s behavior, content, or layout. You use a property with the @State attribute to add state to a view.
     */
     // @State var showFavoritesOnly = false
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        /*
         Lists work with identifiable data. You can make your data identifiable in one of two ways: by calling the identified(by:) method with a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
         */
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites Only")
            }
            /*
             To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the ForEach type instead of passing your collection of data to List.
             */
            ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        /*
         ForEach operates on collections the same way as the list, which means you can use it anywhere you can use a child view, such as in stacks, lists, groups, and more. When the elements of your data are simple value types — like the strings you’re using here — you can use \.self as key path to the identifier.
         */
//        ForEach(["iPhone X", "iPhone XS Max", "iPhone SE"].identified(by: \.self)) { deviceName in
        Group {
            NavigationView {
                LandmarkList()
                    .environmentObject(UserData())
            }
            NavigationView {
                LandmarkList()
                    .environmentObject(UserData())
                    .preferredColorScheme(.dark)
            }
        }
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
#endif
