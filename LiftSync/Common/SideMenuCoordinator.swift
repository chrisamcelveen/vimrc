//
//  SideMenuCoordinator.swift
//  LiftSync
//
//  Created by Anton Dolzhenko on 07.02.17.
//  Copyright © 2017 Onix-Systems. All rights reserved.
//

import SideMenuController

protocol LSSideMenuCoordinator: UITableViewDelegate  {
    var dataSource: LSTableViewDataSource { get set }
    var sideMenuController : UITableViewController! { get set }
    var rootMenuController: SideMenuController { get set}
    func configMenu(items: [LSMenuItem])
}

extension LSSideMenuCoordinator {
    
    func configMenu(items: [LSMenuItem]) {
        let storyboard:UIStoryboard = UIStoryboard(storyboard: .Main)
        
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: "menu")
        SideMenuController.preferences.drawing.sidePanelPosition = .overCenterPanelLeft
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .horizontalPan
        
        sideMenuController = storyboard.instantiateViewController(withIdentifier: "LSSideMenuViewController") as! UITableViewController

        let section = LSTableViewSection(sortOrder: 0, items: items)
        
        dataSource.sections = [section]
        
        sideMenuController.tableView.dataSource = dataSource
        sideMenuController.tableView.delegate = self
        rootMenuController.embed(sideViewController: sideMenuController)
        rootMenuController.embed(centerViewController: items.first!.controller())
    }

}
