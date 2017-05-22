//
//  StreamVC.swift
//  Music Player
//
//  Created by Apple on 21/05/17.
//  Copyright © 2017 polat. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import Toast_Swift

class StreamVC: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer:AVAudioPlayer!
    
    @IBOutlet weak var btnPlay: UIButton!
    var player = AVPlayer()
    
    var isPlay = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlayer()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        btnPlay.setImage(UIImage(named: "play.png"), for: .normal)
        isPlay = false
        player.pause()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPlayClicked(_ sender: Any) {
        if(player.ready){
            
        }else{
            self.view.makeToast("Music File is Streaming", duration: 1.0, position: .center)
        }
        if(isPlay){
            player.pause()
            btnPlay.setImage(UIImage(named: "play.png"), for: .normal)
        }else{
            player.play()
            btnPlay.setImage(UIImage(named: "pause.png"), for: .normal)
        }
        isPlay = !isPlay
        
    }
    
    
    
    func setPlayer() {
       do {
            let url = NSURL(string: "http://stream.radiojavan.com")
            let playerItem = AVPlayerItem.init(url: url! as URL)
            self.player =  AVPlayer(playerItem:playerItem)
            player.volume = 1.0
        
        }
    }
    
    
    

}


extension AVPlayer {
    var ready:Bool {
        let timeRange = currentItem?.loadedTimeRanges.first as? CMTimeRange
        guard let duration = timeRange?.duration else { return false }
        let timeLoaded = Int(duration.value) / Int(duration.timescale) // value/timescale = seconds
        let loaded = timeLoaded > 0
        
        return status == .readyToPlay && loaded
    }
}
