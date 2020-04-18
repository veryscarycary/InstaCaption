//
//  ViewController.swift
//  InstaComments
//
//  Created by Cary Meskell on 4/16/20.
//  Copyright © 2020 Cary Meskell. All rights reserved.
//

import UIKit

class GenerateViewController: UIViewController {
    let quoteBrain = QuoteBrain()
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonDown(_ sender: UIButton) {
        sender.setImage(UIImage(named: "button-pressed"), for: .normal)
    }
    
    @IBAction func onButtonUp(_ sender: UIButton) {
        sender.setImage(UIImage(named: "button"), for: .normal)
        
        textView.text = quoteBrain.getRandomQuote()
    }
}

//MARK: - UITabBarControllerDelegate Section

extension GenerateViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        print(" => \(viewController)")

        if let vc = viewController as? UINavigationController {
            // user tapped BrowseController
            let nextViewController = vc.viewControllers[0] as! BrowseViewController
            nextViewController.quoteBrain = quoteBrain
        }
    }
}

