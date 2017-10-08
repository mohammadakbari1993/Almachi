//
//  ViewController.swift
//  Onboarding
//
//  Created by Training on 20/11/2016.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit
import PaperOnboarding

class ViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {

    @IBOutlet weak var onboardingView: OnboardingView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
        
        
    }
    
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        
        let backgroundColorOne = UIColor(red: 144/255, green: 202/255, blue: 249/255, alpha: 1)
        let backgroundColorTwo = UIColor(red: 239/255, green: 83/255, blue: 80/255, alpha: 1)
        let backGtoundColorThree = UIColor(red :129/255, green: 199/255, blue: 132/255, alpha: 1)
        
        let titleFont = UIFont(name: "Shabnam-Bold", size: 28)
        let descriptionFont =  UIFont(name: "Shabnam", size: 16)
        
        return [(imageName: UIImage(named: "shop1")!, title: "خرید آسان و با اطمینان", description: "از بین انواع محصولات اپل ، محصول مورد نظر خود را انتخاب کنید،مقایسه کنید و سفارش دهید.", iconName: UIImage(named: "shop11")!, color: backgroundColorOne, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont!, descriptionFont: descriptionFont!) ,
                
                (imageName: UIImage(named: "waranty1")!, title: "ضمانت تمامی محصولات ", description: " تمام محصولات را با ضمانت اصل سفارش دهید و از خدمات ۲۴ ساعته ما لذت ببرید!شما میتوانید سفارش خود را تعویض و یا بازگردانید.", iconName: UIImage(named: "waranty11")!, color: backgroundColorTwo, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont!, descriptionFont: descriptionFont!),
                
                (imageName: UIImage(named: "news1")!, title: "جدیترین اخبار و قیمت ها", description: "جدیدترین اخبار محصولات اپل را دنبال کنید، قیمت ها را بررسی کنید و از قیمت های به روز با خبر شوید.", iconName: UIImage(named: "price11")!, color: backGtoundColorThree, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont!, descriptionFont: descriptionFont!)
            ] [index]
        
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
      
    }
    
    
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 {
            
            if self.getStartedButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.getStartedButton.alpha = 0
                })
            }

        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            UIView.animate(withDuration: 0.4, animations: { 
                self.getStartedButton.alpha = 1
            })
        }
    }
    
    
    
    @IBAction func gotStarted(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Mainapp") as! FirstViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "onboardingComplete")
        
        userDefaults.synchronize()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

