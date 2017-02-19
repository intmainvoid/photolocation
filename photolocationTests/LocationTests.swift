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


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
