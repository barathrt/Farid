//
//  CommentsViewController.swift
//  DataFromAPI
//
//  Created by Aqila Nasiry on 4/13/23.
//

import UIKit

class CommentsViewController: UIViewController {
    
    
    @IBOutlet weak var commentsTabView: UITableView!
    let commentsUrl = "https://jsonplaceholder.typicode.com/comments"
    var commentsArray = [CommentsModel]()
    var filteredArray = [CommentsModel]()
    var postId = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentsTabView.delegate = self
        commentsTabView.dataSource = self
        callCommentsAPI()
    }
    
    func callCommentsAPI() {
        
        guard let url = URL(string: commentsUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) {(data, respose, error) in guard let unwarappedData = data else {return}
            do {
                let decodeJSON = JSONDecoder()
                decodeJSON.keyDecodingStrategy = .convertFromSnakeCase
                self.commentsArray = try decodeJSON.decode([CommentsModel].self, from: unwarappedData)
                DispatchQueue.main.async {
                    self.commentsTabView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func filterData() {
//        filteredArray = commentsArray.filter({$0.id == postId})
        for item in commentsArray where item.id == postId {
            filteredArray.append(item)
        }
    }
  
}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentsTabView.dequeueReusableCell(withIdentifier: "CommentsCell", for: indexPath) as! CommentsTableViewCell
        
        if let name = filteredArray[indexPath.row].name {
            cell.nameLabel.text = String(name)
        }
        
        if let email = filteredArray[indexPath.row].email {
            cell.emailLabel.text = email
        }
        
        if let body = filteredArray[indexPath.row].body {
            cell.bodyLabel.text = body
        }
        
        
        return cell
    }
}






