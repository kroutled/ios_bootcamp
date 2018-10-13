//
//  ViewController.swift
//  newRush
//
//  Created by Kyle ROUTLEDGE on 2018/10/13.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 0.2
    var previousLocation = CLLocation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //locationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view, typically from a nib.
        checkLocationServices()
//        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    //zooms into users location
    func zoomedUserLocation() {
        if let location = locationManager.location?.coordinate {
            print("there")
            let region = MKCoordinateRegion.init(center: location, span: MKCoordinateSpan(latitudeDelta: regionInMeters, longitudeDelta: regionInMeters))
            print("every where")
            mapView.setRegion(region, animated: true)
        }
        else
        {
            zoomedUserLocation()
        }
    }
    
    func checkLocationServices() {
        //checks if user has location settings turned on
        if CLLocationManager.locationServicesEnabled()
        {
            setupLocationManager()
            checkLocationAuthorisation()
            
        }
        else
        {
        }
    }
    
    //checks what device permissions are.
    func checkLocationAuthorisation() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            zoomedUserLocation()
            previousLocation = getCenterOfMap(for: mapView)
            break
//        case :
//            break
        case .notDetermined, .denied, .restricted:
            locationManager.requestWhenInUseAuthorization()
//        case :
//            break
//        case .authorizedAlways:
//            break
        }
    }
    
    func getCenterOfMap(for mapView: MKMapView) -> CLLocation {
        let longitude = mapView.centerCoordinate.longitude
        let latitude = mapView.centerCoordinate.latitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}

extension ViewController: CLLocationManagerDelegate {
    //updates map locations as the user moves around
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else {return}
////        zoomedUserLocation()
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        let region = MKCoordinateRegion.init(center: center, span: MKCoordinateSpan(latitudeDelta: regionInMeters, longitudeDelta: regionInMeters))
//        mapView.setRegion(region, animated: true)
//    }
    
    //changes authorisation so that we can use locations on maps
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorisation()
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterOfMap(for: mapView)
        let geoCoder = CLGeocoder()
        
        //guard let previousLocation = self.previousLocation else {return}
        
        //so that map doesnt update location if movements are too small
        guard center.distance(from: previousLocation) > 50 else {return}
        previousLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard case let self = self else {return}
            
            if let _ = error {
                return
            }
            guard let placemark = placemarks?.first else {
                return
            }
            
            let streetNumber = placemark.subThoroughfare ?? ""
            let streetName = placemark.thoroughfare ?? ""
            
            DispatchQueue.main.async {
                self?.addressLabel.text = "\(streetNumber) \(streetName)"
            }
        }
    }
}
