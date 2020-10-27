//
//  VideoViewController.swift
//  searchbar
//
//  Created by POORAN SUTHAR on 15/05/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit
import AVFoundation

class VideoViewController: UIViewController  {
    @IBOutlet weak var getStartedBtn: UIButton!
    var av  = AvplayerController()
    @IBOutlet weak var videoContainerVIew: UIView!
    @IBOutlet weak var loginBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        av.avVideoplayer(view: view, videoContainerVIew: videoContainerVIew)
        // Do any additional setup after loading the view.
        getStartedBtn.layer.cornerRadius = 10
        getStartedBtn.layer.borderWidth = 2
        getStartedBtn.layer.borderColor = UIColor.white.cgColor    }
    
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.isNavigationBarHidden = true
        av.avplayer.play()
        av.pause = false
    }
   
    @IBAction func getStartedAction(_ sender: Any) {
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignUpViewController")
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }
    
}
