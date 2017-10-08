//
//  SplashViewController.swift
//  Almachi
//
//  Created by MacBook Pro on 1396/7/15 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var retry: UIButton!
    @IBOutlet weak var Loadingimage: UIImageView!
    
    @IBOutlet weak var almachilabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
   
        let xposition = self.view.frame.width / 2
        let yposition = self.view.frame.height / 2
        Loadingimage.frame = CGRect(x: xposition - 32, y:yposition , width: 64, height: 64)
        almachilabel.frame = CGRect(x: xposition - 103, y:yposition - 80, width: 206, height: 70)


        
        Loadingimage.loadGif(name: "gif1")
       
        
        if currentReachabilityStatus != .notReachable {
          
            perform(#selector(SplashViewController.ShowOnboarding), with: nil, afterDelay: 3)
        }
    }
    @objc func ShowOnboarding() {
        
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: "onboardingComplete") {
            
            performSegue(withIdentifier: "showlogin", sender: self)
            
        } else  {
            
            performSegue(withIdentifier: "showonboarding", sender: self)
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        internetcheck()
    }
    func internetcheck()  {
        if currentReachabilityStatus == .notReachable {
            Loadingimage.isHidden = true
            retry.isHidden = false
            let alert = UIAlertController(title: "خطا در اتصال به اینرنت", message: "لطفا اتصال خود به اینترنت را بررسی کنید", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func RetryBtn(_ sender: Any) {
        internetcheck2()
        retry.isHidden = true
        Loadingimage.isHidden = false
        
    }
    
    func internetcheck2()  {
        if currentReachabilityStatus == .notReachable {
            let alert = UIAlertController(title: "خطا در اتصال به اینرنت", message: "لطفا اتصال به اینترنت خود را بررسی کنید", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "تایید", style: .default, handler: { (UIAlertAction) in
                self.Loadingimage.isHidden = true
                self.retry.isHidden = false
            }))
            
            self.present(alert, animated: true, completion: nil)
            
            
        } else {
            
            perform(#selector(SplashViewController.ShowOnboarding), with: nil, afterDelay: 3)
            
        }
}
}
