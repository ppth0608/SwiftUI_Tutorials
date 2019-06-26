//
//  UserData.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/06/06.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI
import Combine

/*
 BindableObject
 A bindable object is a custom object for your data that can be bound to a view from storage in SwiftUI’s environment. SwiftUI watches for any changes to bindable objects that could affect a view, and displays the correct version of the view after a change.

 */
final class UserData: BindableObject {
    
    /*
     PassthroughSubject is a simple publisher from the Combine framework that immediately passes any values to its subscribers. SwiftUI subscribes to your object through this publisher, and updates any views that need refreshing when the data changes.
     */
    let didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }

    var landmarks = landmarkData {
        didSet {
            didChange.send(self)
        }
    }
}
