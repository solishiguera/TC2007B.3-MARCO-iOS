//
//  exposicionViewControlViewController.swift
//  Marco
//
//  Created by user193493 on 9/8/21.
//

import UIKit

class exposicionViewControlViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var expositions: [Exposition] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        tableView.dataSource = self
        tableView.delegate = self
        loadExpos();
    }
    
    
    private func loadExpos() { //This function retrieves information in a JSON format from the server
        let url = URL(string: "https://pacific-inlet-83178.herokuapp.com/expositions")!

        URLSession.shared.dataTask(with: url, completionHandler: {[unowned self] data, response, error in
            if let error = error { print(error); return }
            do {
                self.expositions = try JSONDecoder().decode([Exposition].self, from: data!)
                print(self.expositions)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }).resume()
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
