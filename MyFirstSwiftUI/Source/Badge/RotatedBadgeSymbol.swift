//
//  RotatedBadgeSymbol.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/06/11.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol : View {
    
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(self.angle, anchor: .bottom)
    }
}

#if DEBUG
struct RotatedBadgeSymbol_Previews : PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 5))
    }
}
#endif
