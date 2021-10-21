//
//  ExposicionesViewController.swift
//  Marco
//
//  Created by Andres Piñones on 08/10/21.
//

import UIKit

class ExposicionesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var expoTableView: UITableView!
    var expositions = [Exposition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expoTableView.dataSource = self
        expoTableView.delegate = self
        fetchData {
            self.expoTableView.reloadData()
        }
        
        let nib = UINib(nibName: "ExpoTableViewCell", bundle: nil)
        expoTableView.register(nib, forCellReuseIdentifier: "ExpoCell")
        
        
        
    }
    func fetchData(completed: @escaping () -> ()) {
        let url = URL(string: "https://pacific-inlet-83178.herokuapp.com/expositions")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    try self.expositions = JSONDecoder().decode([Exposition].self, from: data!)
                    
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
        return expositions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expo = expositions[indexPath.row]
        let cell = expoTableView.dequeueReusableCell(withIdentifier: "ExpoCell") as! ExpoTableViewCell
        cell.titleLbl?.text = expo.title.capitalized
        var myUrl = expo.photoUrl
        if(myUrl.contains("http://")) {
            let fourthIndex = myUrl.index(myUrl.startIndex, offsetBy: 4)
            myUrl.insert("s", at: fourthIndex)
        }
        
        let url = URL(string: myUrl)
        
        if let data = try? Data(contentsOf: url!) {
            cell.expoImage.image = UIImage(data: data)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ExpoDetailsViewController(nibName: "ExpoDetailsViewController", bundle: nil)
        vc.expo = expositions[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
}
