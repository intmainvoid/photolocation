//
//  Location.swift
//  photolocation
//
//  Created by Gavin Conway on 19/2/17.
//  Copyright © 2017 Gavin Conway. All rights reserved.
//

import Foundation
import CoreLocation

class Location: NSObject, NSCoding {

    var name: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var notes: String?

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }

    init(name: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }

    required convenience init?(coder decoder: NSCoder) {
        guard let name = decoder.decodeObject(forKey: "name") as? String else { return nil }
        let notes = decoder.decodeObject(forKey: "notes") as? String

        let latitude = decoder.decodeDouble(forKey: "latitude") as CLLocationDegrees
        let longitude = decoder.decodeDouble(forKey: "longitude") as CLLocationDegrees

        self.init(name: name, latitude: latitude, longitude: longitude)
        self.notes = notes
    }

    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(notes, forKey: "notes")
        coder.encode(latitude, forKey: "latitude")
        coder.encode(longitude, forKey: "longitude")
    }

}
