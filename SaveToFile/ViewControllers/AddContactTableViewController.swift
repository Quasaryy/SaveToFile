//
//  AddContactTableViewController.swift
//  SaveToFile
//
//  Created by Yury on 7/3/23.
//

import UIKit

// MARK: Delegate
protocol AddContactTableViewControllerDelegate: AnyObject {
    func save(firstName: String, lastName: String) -> Void
}

class AddContactTableViewController: UITableViewController {

    // MARK: IB Outlets
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var firstNameTF: UITextField!
    
    // MARK: Properties
    weak var delegate: AddContactTableViewControllerDelegate?
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBarButton.isEnabled = false

    }

    // MARK: IB Actions
    @IBAction func saveBarButtonTapped(_ sender: UIBarButtonItem) {
        guard let firstName = firstNameTF.text, let lastName = lastNameTF.text else { return }
        delegate?.save(firstName: firstName, lastName: lastName)
        dismiss(animated: true)
    }
    
    @IBAction func textFieldsChanged(_ sender: UITextField) {
        let lastName = lastNameTF.text ?? ""
        let firstName = firstNameTF.text ?? ""
        
        if !lastName.isEmpty && !firstName.isEmpty {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }

}
