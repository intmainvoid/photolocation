//
//  ModelTests.swift
//  photolocation
//
//  Created by Gavin Conway on 19/2/17.
//  Copyright © 2017 Gavin Conway. All rights reserved.
//

import XCTest
import CoreLocation

@testable import photolocation

class ModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        UserDefaults().removeObject(forKey: "locations")
    }

    override func tearDown() {
        super.tearDown()
        UserDefaults().removeObject(forKey: "locations")
    }

    func testModelCreation() {
        setUp()

        let location1 = Location(name: "One Place", latitude: -33.85, longitude: 151.21)
        let location2 = Location(name: "Two Place", latitude: -33.88, longitude: 151.27)
        let location3 = Location(name: "Three Place", latitude: -33.86, longitude: 151.21)

        let model = Model(locationDataAssetName: "MockLocationData")
        XCTAssertEqual(model.locations[0].name, location1.name)
        XCTAssertEqual(model.locations[0].latitude, location1.latitude)
        XCTAssertEqual(model.locations[0].longitude, location1.longitude)

        XCTAssertEqual(model.locations[1].name, location2.name)
        XCTAssertEqual(model.locations[1].latitude, location2.latitude)
        XCTAssertEqual(model.locations[1].longitude, location2.longitude)

        XCTAssertEqual(model.locations[2].name, location3.name)
        XCTAssertEqual(model.locations[2].latitude, location3.latitude)
        XCTAssertEqual(model.locations[2].longitude, location3.longitude)

        tearDown()
    }

    func testModelRecreation() {
        setUp()

        let model1 = Model(locationDataAssetName: "MockLocationData")
        let model2 = Model()

        XCTAssertEqual(model1.locations[0].name, model2.locations[0].name)
        XCTAssertEqual(model1.locations[0].latitude, model2.locations[0].latitude)
        XCTAssertEqual(model1.locations[0].longitude, model2.locations[0].longitude)

        XCTAssertEqual(model1.locations[1].name, model2.locations[1].name)
        XCTAssertEqual(model1.locations[1].latitude, model2.locations[1].latitude)
        XCTAssertEqual(model1.locations[1].longitude, model2.locations[1].longitude)

        XCTAssertEqual(model1.locations[2].name, model2.locations[2].name)
        XCTAssertEqual(model1.locations[2].latitude, model2.locations[2].latitude)
        XCTAssertEqual(model1.locations[2].longitude, model2.locations[2].longitude)

        tearDown()
    }

}
