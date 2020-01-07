//
//  FirstViewController.swift
//  breakpoint
//
//  Created by Trinh Thai on 12/28/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var ibTableView: UITableView!
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ibTableView.delegate = self
        ibTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (messArray) in
            self.messageArray = messArray
            self.ibTableView.reloadData()
        }
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else {
            return UITableViewCell()
        }
        let image = UIImage(named: "defaultProfileImage")
        let mess = self.messageArray[indexPath.row]
        cell.configureCell(profileImage: image ?? UIImage(), email: mess.senderId, content: mess.content)
        return cell
    }
}

