//
//  TabBarSettingsViewController.swift
//  CheesLeadersMVVM
//
//  Created by Cengizhan Kervancı on 1.06.2023.
//

import UIKit

class TabBarSettingsViewController: UITabBarController , UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabOne = TabOneViewController()
        let taboneBarItem = UITabBarItem(title: "Daily", image: .add, selectedImage: .add)
        tabOne.tabBarItem = taboneBarItem
        
        self.viewControllers = [tabOne]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           print("Selected \(viewController.title!)")
       }

}
