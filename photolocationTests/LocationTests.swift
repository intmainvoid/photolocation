//
//  LocationTests.swift
//  photolocation
//
//  Created by Gavin Conway on 19/2/17.
//  Copyright © 2017 Gavin Conway. All rights reserved.
//

import XCTest
import CoreLocation

@testable import photolocation

class LocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocationCreation() {
        setUp()

        let name = "A great location"
        let latitude = -33.89
        let longitude = -152.32

        let location = Location(name: name, latitude: latitude, longitude: longitude)
        XCTAssertEqual(location.name, name, "location.name '\(location.name)' is unexpected")
        XCTAssertEqual(location.latitude, latitude, "location.latitude '\(location.latitude)' is unexpected")
        XCTAssertEqual(location.longitude, longitude, "location.longitude '\(location.longitude)' is unexpected")

        tearDown()
    }

    func testLocationNotes() {
        setUp()

        let notes = "These are some notes"
        let location = Location(name: "Another great location", latitude: -33.90, longitude: -152.32)
        location.notes = notes

        XCTAssertEqual(location.notes, notes, "location.notes '\(location.notes)' is unexpected")

        tearDown()
    }

    func testLocationDerivedCoordinate() {
        setUp()

        let latitude = -33.89
        let longitude = -152.32
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let location = Location(name: "Another great location", latitude: latitude, longitude: longitude)

        XCTAssertEqual(location.coordinate.latitude, coordinate.latitude, "location.coordinate.latitude '\(location.coordinate.latitude)' is unexpected")
        XCTAssertEqual(location.coordinate.longitude, coordinate.longitude, "location.coordinate.longitude '\(location.coordinate.longitude)' is unexpected")

        tearDown()
    }

    func testLocationDistance() {
        setUp()

        let latitude = -33.889967
        let longitude = 151.276440
        let location = Location(name: "Another great location", latitude: latitude, longitude: longitude)

        let otherLocation = CLLocation(latitude: -33.860178, longitude: 151.212706)

        let distance = location.distanceFromLocation(location: otherLocation)

        XCTAssertEqual(distance, 6759.312570926123, "distance '\(distance)' has an unexpected value")

        tearDown()
    }

}
