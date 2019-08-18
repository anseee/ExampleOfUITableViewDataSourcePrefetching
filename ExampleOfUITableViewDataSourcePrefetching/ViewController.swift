//
//  ViewController.swift
//  ExampleOfUITableViewDataSourcePrefetching
//
//  Created by 박성원 on 15/08/2019.
//  Copyright © 2019 sungwon. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        let apiManager = ApiManager()
        apiManager.loadData { photos in
            if let photos = photos {
                self.photos = photos
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }

    }
}

//extension ViewController: UITableViewDataSourcePrefetching {
//    func tableView(_ tableView: UITableView,
//                   prefetchRowsAt indexPaths: [IndexPath]) {
//
//    }
//
//    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
//
//    }
//}
//

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let photo: Photo = self.photos[indexPath.row];
        cell.photoImageView.sd_setImage(with: URL(string: photo.urls!["regular"]!), completed: nil)
        cell.descLabel.text = photo.description
        
        return cell
    }
}


