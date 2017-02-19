//
//  LocationsViewController.swift
//  photolocation
//
//  Created by Gavin Conway on 19/2/17.
//  Copyright © 2017 Gavin Conway. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class LocationsViewController: UIViewController {

    var usersLocation: CLLocationCoordinate2D?
    var sortedLocations: Array<Location> = []

    fileprivate let cellReuseIdentifier = "cellID"

    @IBOutlet weak var locationsTableView: UITableView!

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationsTableView.delegate = self
        locationsTableView.dataSource = self
        locationsTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellReuseIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let usersLocation = Model.sharedInstance.currentUserLocation
        if let usersLocation = usersLocation {
            sortedLocations = Model.sharedInstance.locations.sorted(by: { (firstLocation: Location, secondLocation: Location) -> Bool in
                return firstLocation.distanceFromLocation(location: usersLocation) < secondLocation.distanceFromLocation(location: usersLocation)
            })
        } else {
            sortedLocations = Model.sharedInstance.locations
        }
        locationsTableView.reloadData()
    }

}

extension LocationsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "locationViewController") as! LocationViewController
        let location = sortedLocations[indexPath.row]
        detailViewController.location = location
        present(detailViewController, animated: true, completion: nil)
    }
}

extension LocationsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        let location = sortedLocations[indexPath.row]
        cell.textLabel?.text = location.name

        return cell

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedLocations.count
    }

}
