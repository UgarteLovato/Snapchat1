//
//  ElegirUsuarioViewController.swift
//  Snapchat1
//
//  Created by Mac Tecsup on 27/11/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//

import UIKit

class ElegirUsuarioViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self as! UITableViewDelegate
        tableView.dataSource = self as! UITableViewDataSource
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
