//
//  QueueVC.swift
//  Music Player
//
//  Created by Apple on 15/05/17.
//  Copyright © 2017 polat. All rights reserved.
//

import UIKit

class QueueVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tblVIewQueue: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // tableView delegate and datasource method
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblVIewQueue.dequeueReusableCell(withIdentifier: "QueueTCC") as! QueueTCC
        cell.selectionStyle = .none
        
        return cell
    }
}
