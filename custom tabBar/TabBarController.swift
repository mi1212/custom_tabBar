//
//  TabBarController.swift
//  custom tabBar
//
//  Created by Mikhail Chuparnov on 06.07.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
//        configurateTabBar()
        setTabBarShape()
        
        
        viewControllers = [
            setupTabBar(viewController: ProfileViewController(), title: "profile", image: "person.crop.circle"),
            setupTabBar(viewController: PhotoViewController(), title: "photo", image: "text.below.photo.fill") ,
            setupTabBar(viewController: SettingsViewController(), title: "settings", image: "rosette")
        ]
        
    }
    
    // сделать табБар прозрачным при скроллинге
    private func configurateTabBar() {
                
        let tabBarAppearance = UITabBarAppearance()

        tabBarAppearance.configureWithTransparentBackground()

        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
        
    }
    
    private func setupTabBar(viewController: UIViewController, title: String, image: String) -> UIViewController {
        
        let vc = UINavigationController(rootViewController: viewController)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(systemName: image)
        return vc
    }
    
    private func setTabBarShape() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 10
        
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnX * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 1.7
        )
        
        roundLayer.path = bezierPath.cgPath
        tabBar.isMultipleTouchEnabled = true
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        roundLayer.fillColor = UIColor.tabBarBackgroundColor.cgColor
        
        tabBar.itemWidth = width / 1
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.7
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowRadius = 20
        
        tabBar.itemPositioning = .automatic
        self.tabBar.tintColor = .tabBarRegularItemColor
        self.tabBar.unselectedItemTintColor = .tabBarAccentItemColor
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
