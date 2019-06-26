//
//  CircleImage.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/06/04.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
#endif
