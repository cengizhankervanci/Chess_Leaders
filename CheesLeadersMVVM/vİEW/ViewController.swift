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
        
        let vc1 = UINavigationController(rootViewController: DailyTabbarViewController())
        let vc2 = UINavigationController(rootViewController: BulletTabbarViewController())
        let vc3 = UINavigationController(rootViewController: RapidTabbarViewController())
        let vc4 = UINavigationController(rootViewController: BlitzViewController())
        
        vc1.title = "Daily"
        vc2.title = "Bullet"
        vc3.title = "Rapid"
        vc4.title = "Live Blitz"
        
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let imagesName = ["powersleep","flag.2.crossed.fill","figure.run","hare"]
        
        for x in 0..<imagesName.count {
            items[x].image = UIImage(systemName: imagesName[x])
        }
        
        present(tabBarVC, animated: true)
    }
}

