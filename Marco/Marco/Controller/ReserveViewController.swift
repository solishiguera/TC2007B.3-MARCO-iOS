//
//  ReserveViewController.swift
//  Marco
//
//  Created by Andres Piñones on 20/10/21.
//

import UIKit
import Firebase
import FirebaseAuth

class ReserveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var numPersonas: UITextField!
    @IBOutlet weak var visitasTableView: UITableView!
    
    var visits = [Visit]()
    var visitID: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        visitasTableView.dataSource = self
        visitasTableView.delegate = self
        fetchData {
            self.visitasTableView.reloadData()
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    func fetchData(completed: @escaping () -> ()) {
        let url = URL(string: "https://pacific-inlet-83178.herokuapp.com/visits")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    try self.visits = JSONDecoder().decode([Visit].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "visitCell")
        let visit = visits[indexPath.row]
        cell.textLabel?.text = visit.guide
        
        cell.backgroundColor = UIColor(red: 243/255, green: 235/255, blue: 230/255, alpha: 1.0)
        
        let string = visit.date
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
        let date = dateFormatter.date(from: string)!
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = tempLocale
        cell.detailTextLabel?.text = dateFormatter.string(from: date)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let visit = visits[indexPath.row]
        visitID = visit.id
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func reserveButtonPressed(_ sender: Any) {
        guard let userEmail = Auth.auth().currentUser?.email else {return}
        guard let userId = Auth.auth().currentUser?.uid else {return}
        guard let numPersonas = numPersonas.text, !numPersonas.isEmpty else {return}
        let personas = Int(numPersonas)
        let params: [String: Any] = ["userId": userId,"userEmail":userEmail, "visitId":visitID, "persons":personas ?? 1]
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/reserve", method: .post, parameters: params, stringParameters: nil){(event: String?, error) in
            if error != nil{
                DispatchQueue.main.async {
                    self.displayAlert(title: "Error", message: "Error reservando visita")
                }
            }else{
                DispatchQueue.main.async {
                    self.displayAlert(title: "Exito", message: "Tu visita se ha reservado")
                }
            }
        }
    }
    
}
