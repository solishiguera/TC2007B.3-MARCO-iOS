//
//  exposicionViewControlViewController.swift
//  Marco
//
//  Created by user193493 on 9/8/21.
//

import UIKit

class exposicionViewControlViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var expositions: [Exposition] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        tableView.dataSource = self
        tableView.delegate = self
        fetchData()
    }
    
    
    func fetchData() {
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/expositions", method: .get, parameters: nil, stringParameters: nil) { (event: ExpositionRequest?, error) in
            if error != nil {
                print(error ?? "Error al hacer request")
            } else {
                guard let expositions = event?.expositions else { return }
                self.expositions = expositions
                self.tableView.reloadData()
            }
    }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expositions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "expoCell")
        let exposition = expositions[indexPath.row]
        cell.textLabel?.text = exposition.title
        cell.detailTextLabel?.text = exposition.startDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ExpoDetailsViewController(nibName: "ExpoDetailsViewController", bundle: nil)
        vc.expo = expositions[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
    
    
    
}
