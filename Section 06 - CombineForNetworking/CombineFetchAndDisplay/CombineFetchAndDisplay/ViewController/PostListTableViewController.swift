//
//  PostListTableViewController.swift
//  CombineFetchAndDisplay
//
//  Created by Julio Ismael Robles on 18/11/2021.
//

import Foundation
import UIKit
import Combine

class PostListTableViewController: UITableViewController {
    
    private var webservice = Webservice()
    private var cancellable: AnyCancellable?
    
    private var posts = [Post]() {
        ///we need to refresh the tableview when data is received
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancellable = self.webservice.getPosts()
            ///catch errors, this case will return an empty list
            .catch { _ in Just(self.posts) }
            /// asign the received values to a variable 
            .assign(to: \.posts, on: self)
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)
        let post = self.posts[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }
}
