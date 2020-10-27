//
//  SignUpViewController.swift
//  searchbar
//
//  Created by POORAN SUTHAR on 15/05/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit
enum Segmentaction : Int{
    case SignIn
    case SignUp
}

class SignUpViewController: UIViewController {
    var av = AvplayerController()
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var passwordtxtField: UITextField!
    @IBOutlet weak var emailorPhonetxtField: UITextField!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var videoContainer: UIView!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        av.avVideoplayer(view: view, videoContainerVIew: videoContainer)
        containerView.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        av.avplayer.play()
        av.pause = false
    }
    @IBAction func segmentControllerAction(_ sender: Any) {
        switch segmentController.selectedSegmentIndex{
        case Segmentaction.SignIn.rawValue : signinUpdates()
           
        case Segmentaction.SignUp.rawValue : signupupdates()
            
        default : print("error")
        }
    }
    
    func signinUpdates(){
        button.setTitle("LogIn", for: .normal)
        forgetPasswordButton.isHidden = false
    }
    
    func signupupdates(){
        button.setTitle("Sign Up", for: .normal)
        forgetPasswordButton.isHidden = true
    }
}
