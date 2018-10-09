//
//  SecondViewController.swift
//  ex00
//
//  Created by Kyle ROUTLEDGE on 2018/10/08.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.005, 0.005)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-26.204794, 28.040231)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = location
        pin.title = "WeThinkCode_"
        pin.subtitle = "Are you born to code?"
        mapView.addAnnotation(pin)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if annotation is MKUserLocation
        {
            return nil
        }
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named:"icons8-map-pin-50")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    @IBAction func controlBarType(_ sender: UISegmentedControl)
    {
        switch (sender.selectedSegmentIndex)
        {
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .satellite
            case 2:
                mapView.mapType = .hybrid
            default:
                mapView.mapType = .hybrid
        }
    }
    
    var locationManager = CLLocationManager()
    
    @IBAction func geolocateButton(_ sender: UIButton) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10
        mapView.showsUserLocation = true
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location Updated")
         mapView.setRegion(MKCoordinateRegionMake(locations[0].coordinate, MKCoordinateSpanMake(0.005, 0.005)), animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

