//
//  MapView.swift
//  MyFirstSwiftUI
//
//  Created by Ben on 2019/06/04.
//  Copyright © 2019 VIBE. All rights reserved.
//

import SwiftUI
import MapKit

/*
 The UIViewRepresentable protocol has two requirements you need to add: a makeUIView(context:) method that creates an MKMapView, and an updateUIView(_:context:) method that configures the view and responds to any changes.
 
 The UIViewRepresentable protocol has two requirements you need to add: a makeUIView(context:) method that creates an MKMapView, and an updateUIView(_:context:) method that configures the view and responds to any changes.
 */
struct MapView : UIViewRepresentable {
    
    var coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
#endif
