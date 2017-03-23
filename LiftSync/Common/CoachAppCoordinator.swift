//
//  CoachAppCoordinator.swift
//  LiftSync
//
//  Created by Anton Dolzhenko on 05.02.17.
//  Copyright © 2017 Onix-Systems. All rights reserved.
//

import UIKit
import SideMenuController

final class AppCoordinator:NSObject, LSSideMenuCoordinator {
    
    var window: UIWindow
    lazy var storyboard:UIStoryboard = UIStoryboard(storyboard: .Main)
    var rootMenuController = SideMenuController()
    var sideMenuController:UITableViewController!
    var dataSource = LSTableViewDataSource()
    
    init(window: UIWindow) {
        self.window = window
        super.init()
        let menuItems = [LSMenuItem(title:"Dashboard",
                                  controller: coachAnalyticsViewController)]
        configMenu(items: menuItems)
        self.window.rootViewController = rootMenuController
        self.window.makeKeyAndVisible()
    }
    
    func start() { }
    
    
    func coachAnalyticsViewController()->UIViewController {
        let coachAnalyticsController = LSCoachAnalyticsViewController()
        let coachAnalyticsNavigationController = UINavigationController(rootViewController: coachAnalyticsController)
        return coachAnalyticsNavigationController
    }
}

extension AppCoordinator: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = dataSource.sections[indexPath.section].items[indexPath.row] as? LSMenuItem else { return }
        let controller = item.controller()
        rootMenuController.embed(centerViewController:controller)
    }
    
}
