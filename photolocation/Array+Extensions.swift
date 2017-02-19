//
//  Array+Extensions.swift
//  photolocation
//
//  Created by Gavin Conway on 19/2/17.
//  Copyright © 2017 Gavin Conway. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {

    // Remove first collection element that is equal to the given `object`:
    mutating func removeElement(object: Element?) {
        guard object != nil else {
            return
        }
        if let index = index(of: object!) {
            remove(at: index)
        }
    }
}
