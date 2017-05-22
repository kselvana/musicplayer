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
    
    var arrImage = ["demo3.jpg","HalfGF2.jpg"]
    var arrName = ["Michael Jackson","Half GirlFriend"]
    
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
        
        return arrImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblVIewQueue.dequeueReusableCell(withIdentifier: "QueueTCC") as! QueueTCC
        cell.selectionStyle = .none
        
        cell.imgViewMain.image = UIImage(named: arrImage[indexPath.row])
        cell.lblName.text = arrName[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        MyViewState.selectedIndex = indexPath.row
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "CALL"), object: nil)
    }
}
