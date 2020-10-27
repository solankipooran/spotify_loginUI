//
//  AVPlayer.swift
//  searchbar
//
//  Created by POORAN SUTHAR on 15/05/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
class AvplayerController {
    var avplayer : AVPlayer!
    var avplayerlayer : AVPlayerLayer!
    var pause : Bool = false

    func avVideoplayer(view : UIView , videoContainerVIew  : UIView ){
        guard let url = Bundle.main.url(forResource: "Video", withExtension: "MOV") else{return}
        avplayer = AVPlayer(url: url)
        avplayerlayer = AVPlayerLayer(player: avplayer)
        avplayerlayer.videoGravity = .resizeAspectFill
        avplayer.volume = 0
        avplayer.actionAtItemEnd = .none
        avplayerlayer.frame = view.layer.bounds
        videoContainerVIew.layer.addSublayer(avplayerlayer)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: avplayer.currentItem)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification){
          let p: AVPlayerItem = notification.object as! AVPlayerItem
                 p.seek(to: .zero)
      }
}
