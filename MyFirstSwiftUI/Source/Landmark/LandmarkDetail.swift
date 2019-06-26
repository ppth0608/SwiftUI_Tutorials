//
//  LandmarkDetail.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/06/04.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
    
    @EnvironmentObject var userData: UserData
    
    var landmark: Landmark

    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            CircleImage(image: landmark.image(forSize: 250))
                .offset(y: -150)
                .padding(.bottom, -130)
            TextView(landmark: landmark).environmentObject(self.userData)
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

#if DEBUG
struct LandmarkDetail_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0]).environmentObject(UserData())
    }
}
#endif
