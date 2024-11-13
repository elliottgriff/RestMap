//
//  MapView.swift
//  RestMap
//
//  Created by Elliott Griffin on 10/19/24.
//

import SwiftUI
import MapKit
import Firebase

struct MapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var toilets: [Toilet]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.removeAnnotations(uiView.annotations)
        let annotations = toilets.map { toilet -> MKPointAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = toilet.name
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: toilet.coordinate.latitude,
                longitude: toilet.coordinate.longitude
            )
            return annotation
        }
        uiView.addAnnotations(annotations)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        // Handle annotation taps
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            // Implement navigation to toilet detail view
        }
    }
}
