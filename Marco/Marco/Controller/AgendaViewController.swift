//
//  AgendaViewController.swift
//  Marco
//
//  Created by Diego Solis on 10/13/21.
//

import UIKit

class AgendaViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var events = [Event]()
    
    @IBOutlet weak var eventTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        eventTableView.delegate = self
        eventTableView.dataSource = self
        fetchData {
            self.eventTableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    func fetchData(completed: @escaping () -> ()) {
        let url = URL(string: "https://pacific-inlet-83178.herokuapp.com/events")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                   try self.events = JSONDecoder().decode([Event].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        events[section].date
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        events.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events[section].events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = events[indexPath.section].events[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "eventCell")
        cell.textLabel?.text = event
        return cell
    }
}
