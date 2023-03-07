//
//  TableViewController.swift
//  SaveToFile
//
//  Created by Yury on 7/3/23.
//

import UIKit

class TableViewController: UITableViewController, AddContactTableViewControllerDelegate {
    
    var contacts: [Contact] = StorageManager.shared.readFromPlist()

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configurating the cell
        var content = cell.defaultContentConfiguration()
        content.text = contacts[indexPath.row].fullName
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as? UINavigationController
        let AddContactVC = navigationController?.topViewController as! AddContactTableViewController
        AddContactVC.delegate = self
    }
    
    @IBAction func unwindSegue(for unwindSegue: UIStoryboardSegue) {
        
    }
    
}

// MARK: Methods
extension TableViewController {
    func save(firstName: String, lastName: String) {
        contacts.append(Contact(firstName: firstName, lastName: lastName))
        StorageManager.shared.saveToPlist(model: contacts)
        tableView.reloadData()
    }
}
