//
//  LocationViewController.swift
//  photolocation
//
//  Created by Gavin Conway on 19/2/17.
//  Copyright © 2017 Gavin Conway. All rights reserved.
//

import Foundation
import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!

    var location: Location? { didSet {
        if let nameTextField = nameTextField {
            nameTextField.text = location?.name
        }
        if let notesTextView = notesTextView {
            notesTextView.text = location?.notes
        }
    }}

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text = location?.name
        notesTextView.text = location?.notes
    }

    override func viewWillDisappear(_ animated: Bool) {
        location?.name = nameTextField.text!
        location?.notes = notesTextView.text!
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        Model.sharedInstance.locations.removeElement(object: location)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
