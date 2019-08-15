//
//  ViewController.swift
//  ExampleOfUITableViewDataSourcePrefetching
//
//  Created by 박성원 on 15/08/2019.
//  Copyright © 2019 sungwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
        let apiManager = ApiManager()
        apiManager.loadData { photos in
            print(photos!)
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
//extension ViewController: UITableViewDelegate {
//
//}
//
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//}


