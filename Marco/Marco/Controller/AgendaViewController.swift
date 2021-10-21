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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("HeaderTableViewCell", owner: self, options: nil)?.first as! HeaderTableViewCell
        let string = events[section].date
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
        let date = dateFormatter.date(from: string)!
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = tempLocale
        header.dateLbl.text = dateFormatter.string(from: date)
        
        return header
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
        cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = UIColor(red: 243/255, green: 235/255, blue: 230/255, alpha: 1.0)
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
        return cell
    }
}
