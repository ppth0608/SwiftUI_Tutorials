//
//  HikeBadge.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/08/02.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI

struct HikeBadge : View {
    
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1 / 3)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
        }
    }
}

#if DEBUG
struct HikeBadge_Previews : PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
#endif
