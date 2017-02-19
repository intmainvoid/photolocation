//
//  Model.swift
//  photolocation
//
//  Created by Gavin Conway on 19/2/17.
//  Copyright © 2017 Gavin Conway. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class Model {

    static let sharedInstance = Model()

    var locations: Array<Location> = []
    var currentUserLocation: CLLocation?

    init(locationDataAssetName: String = "LocationData") {
        if let locationsArray = UserDefaults().object(forKey: "locations") as? Data {
            locations = NSKeyedUnarchiver.unarchiveObject(with: locationsArray) as! Array<Location>
            return
        }

        guard let asset = NSDataAsset(name: locationDataAssetName, bundle: Bundle.main) else {
            return
        }
        let json = JSON(data: asset.data)
        for (_, locationObj):(String, JSON) in json["locations"] {
            let name = locationObj["name"].stringValue
            let lat = locationObj["lat"].doubleValue
            let lng = locationObj["lng"].doubleValue
            let location = Location(name: name, latitude: lat, longitude: lng)
            locations.append(location)
        }
        save()
    }

    func save() {
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: locations)
        UserDefaults().set(archivedData, forKey:"locations")
    }

    static func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}

