//
//  Badge2.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/06/11.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI

struct Badge : View {
    
    static let rotationCount = 8
    
    var badgeSymbols: some View {
        ForEach(0..<Badge.rotationCount) { i in
            RotatedBadgeSymbol(angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0)
        }.opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(1/4, anchor: .top)
                    .position(x: geometry.size.width / 2,
                              y: (3/4) * geometry.size.height)
                
            }
        }.scaledToFit()
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
