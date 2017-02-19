//
//  ViewController.swift
//  photolocation
//
//  Created by Gavin Conway on 19/2/17.
//  Copyright © 2017 Gavin Conway. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController  {

    @IBOutlet weak var mapView: MKMapView!

    var locationManager = CLLocationManager()

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let annotations: Array<MKAnnotation> = loadLocations()
        mapView.showAnnotations(annotations, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func loadLocations() -> Array<LocationAnnotation> {
        removeAllAnnotations()
        var annotations: Array<LocationAnnotation> = [];
        for location in Model.sharedInstance.locations {
            let annotation = LocationAnnotation(location: location)
            annotations.append(annotation)
            self.mapView.addAnnotation(annotation)
        }
        return annotations
    }

    private func removeAllAnnotations() {

        let mapAnnotations = (self.mapView.annotations.filter { (annotation: MKAnnotation) in
            return !(annotation is MKUserLocation)
        })
        mapView.removeAnnotations(mapAnnotations)
    }

    @IBAction func longPressDetected(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let point = gestureRecognizer.location(in: mapView)
            let tapLocation = mapView.convert(point, toCoordinateFrom: mapView)

            let photoLocation = Location(name: "New Location", latitude: tapLocation.latitude, longitude: tapLocation.longitude)
            Model.sharedInstance.locations.append(photoLocation)
            loadDetailViewController(with: photoLocation)
        }
    }

    fileprivate func loadDetailViewController(with location: Location) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "locationViewController") as! LocationViewController
        detailViewController.location = location
        present(detailViewController, animated: true, completion: nil)
    }
}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "annotationReuseId"
        var storeIconView: MKAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if storeIconView != nil {
            storeIconView?.annotation = annotation

        } else {
            storeIconView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            storeIconView?.canShowCallout = true
            let disclosureButton = UIButton(type: .detailDisclosure)
            storeIconView?.rightCalloutAccessoryView = disclosureButton
        }
        
        return storeIconView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation as? LocationAnnotation {
            loadDetailViewController(with: annotation.location)
        }
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("User Location: \(userLocation.location)")
        Model.sharedInstance.currentUserLocation = userLocation.location
    }

}


class LocationAnnotation : NSObject, MKAnnotation {

    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var location: Location

    init(location: Location) {
        self.title = location.name
        self.subtitle = location.notes
        self.coordinate = location.coordinate
        self.location = location
    }
}
