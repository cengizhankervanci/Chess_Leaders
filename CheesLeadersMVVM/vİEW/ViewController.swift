//
//  ViewController.swift
//  CheesLeadersMVVM
//
//  Created by Cengizhan Kervancı on 31.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabbar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    
    func createTabbar(){
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstTabbarViewController())
        let vc2 = UINavigationController(rootViewController: SecondTabbarViewController())
        let vc3 = UINavigationController(rootViewController: ThirdTabbarViewController())
        
        vc1.title = "Daily"
        vc2.title = "Rush"
        vc3.title = "Battle"
        
        tabBarVC.setViewControllers([vc1,vc2,vc3], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let imagesName = ["powersleep","figure.run","flag.2.crossed.fill"]
        
        for x in 0..<imagesName.count {
            items[x].image = UIImage(systemName: imagesName[x])
        }
        
        present(tabBarVC, animated: true)
    }
}

