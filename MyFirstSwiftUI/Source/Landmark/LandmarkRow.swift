//
//  LanmarkRow.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/06/04.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI

struct LandmarkRow : View {
    
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image(forSize: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        /*
         Group is a container for grouping view content. Xcode renders the group’s child views as separate previews in the canvas.
         */
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
            /*
             Use the previewLayout(_:) modifier to set a size that approximates a row in a list.
             */
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
