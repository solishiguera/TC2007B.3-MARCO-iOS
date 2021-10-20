//
//  HomeViewController.swift
//  Marco
//
//  Created by Diego Solis on 9/8/21.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var news = [News]()
    
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet var bttnComprarBoletos: UIButton!
    @IBOutlet weak var tag: UILabel!
    
    
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        fetchData {
            self.newsTableView.reloadData()
        }

        super.viewDidLoad()
        bttnComprarBoletos.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        if Auth.auth().currentUser != nil{
            let user = Auth.auth().currentUser
            let uid : String = user!.uid
        db.collection("users").document(uid).getDocument{(doc, error) in
            let name = doc?.get("nombres")
            self.tag.text = name as? String
        }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func comprarBoleto(_ sender: Any) {
        let buyTicketViewController = BuyTicketViewController(nibName: "BuyTicketViewController", bundle: nil)
        
        self.present(buyTicketViewController, animated: true, completion: nil)
    }
    
    @IBAction func logOut(_ sender: Any) {
        if Auth.auth().currentUser != nil{
            do {
                try? Auth.auth().signOut()
            }
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    func fetchData(completed: @escaping () -> ()) {
        let url = URL(string: "https://pacific-inlet-83178.herokuapp.com/news")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                   try self.news = JSONDecoder().decode([News].self, from: data!)
                    
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
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "newCell")
        let new = news[indexPath.row]
        cell.textLabel?.text = new.title.capitalized
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = new.description
        cell.backgroundColor = UIColor(red: 243/255, green: 235/255, blue: 230/255, alpha: 1.0)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetailsViewController(nibName: "NewsDetailsViewController", bundle: nil)
            vc.new = news[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
}
