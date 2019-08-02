//
//  MapView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 3/25/1398 AP.
//  Copyright © 1398 Sajjad Kharrazi. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapView: UIViewRepresentable {
    
    @Binding var locationManager: CLLocationManager
    @Binding var userLocation: CLLocationCoordinate2D
    @Binding var annotations: [Artwork]
    @Binding var state: SnappState

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        self.locationManager.delegate = context.coordinator
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        let coordinateRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(coordinateRegion, animated: true)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.removeAnnotations(view.annotations)
        view.isUserInteractionEnabled = true
        if self.state == .price {
            view.showAnnotations(self.annotations, animated: true)
            view.isUserInteractionEnabled = false
        } else {
            view.addAnnotations(self.annotations)
            let coordinateRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
            view.setRegion(coordinateRegion, animated: true)
        }
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        var parent: MapView
        
        init(_ mapView: MapView) {
            self.parent = mapView
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            self.parent.userLocation = locValue
            self.parent.locationManager.stopUpdatingLocation()
        }
        
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            self.parent.userLocation = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
            return
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? Artwork else { return nil }
            let imageName = annotation.tag == .source ? "sourceMarker" : "destinationMarker"

            let identifier = "marker"
            var view: MKAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            }
            view.image = UIImage(named: imageName)
            view.centerOffset = CGPoint(x: 0, y: -30)
            return view
        }
    }
}
