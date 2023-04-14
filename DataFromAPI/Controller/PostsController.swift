//
//  ViewController.swift
//  DataFromAPI
//
//  Created by Aqila Nasiry on 4/13/23.
//

import UIKit

class PostsViewController: UIViewController {
    
    
    @IBOutlet weak var postsTabView: UITableView!
    let postsUrl = "https://jsonplaceholder.typicode.com/posts"
    var postsArray = [PostsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTabView.delegate = self
        postsTabView.dataSource = self
        
        callPostsAPI()
    }
    
    
    func callPostsAPI() {
        guard let url = URL(string: postsUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in guard let unwarappeData = data else {return}
            do {
                let decodeJSON = JSONDecoder()
                decodeJSON.keyDecodingStrategy = .convertFromSnakeCase
                self.postsArray = try decodeJSON.decode([PostsModel].self, from: unwarappeData)
                DispatchQueue.main.async {
                    self.postsTabView.reloadData()
                }
            }catch  {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
    
    
    extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            postsArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = postsTabView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath) as! PostsTableViewCell
            
            if let userId = postsArray[indexPath.row].userId {
                cell.userIdLabel.text = String(userId)
            }
            
            if let id = postsArray[indexPath.row].id {
                cell.idLabel.text = String(id)
            }
            
            if let title = postsArray[indexPath.row].title {
                cell.titleLabel.text = title
            }
            
            if let body = postsArray[indexPath.row].body {
                cell.bodyLabel.text = body
            }
            return cell
            
            
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let commentsVC = storyBoard.instantiateViewController(withIdentifier: "commentsView") as! CommentsViewController
            commentsVC.postId = postsArray[indexPath.row].id ?? -1
            self.navigationController?.pushViewController(commentsVC, animated: true)
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
        
    }
    
    
    


