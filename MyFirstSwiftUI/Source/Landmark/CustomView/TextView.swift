//
//  ContentView.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/06/04.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI

struct TextView : View {
    
    @EnvironmentObject var userData: UserData

    var landmark: Landmark
    
    var landmarkIndex: Int {
        return userData.landmarks.firstIndex(of: landmark)!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(landmark.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .color(.black)
                    .multilineTextAlignment(.center)
                Button(action: {
                    self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                }) {
                    if self.userData.landmarks[self.landmarkIndex].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
            }
            HStack {
                Text(landmark.park)
                    .font(.subheadline)
                    .color(.gray)
                /*
                 A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents.
                 */
                Spacer()
                Text(landmark.state)
                    .font(.subheadline)
                    .color(.gray)
            }
        }
        .padding()
    }
}

#if DEBUG
struct TextView_Previews : PreviewProvider {
    static var previews: some View {
        TextView(landmark: landmarkData[0]).environmentObject(UserData())
    }
}
#endif
