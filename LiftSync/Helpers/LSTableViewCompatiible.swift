//
//  TableViewCompatible.swift
//  LiftSync
//
//  Created by Anton Dolzhenko on 06.02.17.
//  Copyright © 2017 Onix-Systems. All rights reserved.
//

import UIKit

protocol LSTableViewCompatible {
    
    var reuseIdentifier: String { get }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
    
}

protocol TableViewSection {
    
    var sortOrder: Int { get set }
    var items: [LSTableViewCompatible] { get set }
    var headerTitle: String? { get set }
    var footerTitle: String? { get set }
    
    init(sortOrder: Int, items: [LSTableViewCompatible], headerTitle: String?, footerTitle: String?)
    
}

protocol LSConfigurable {
    
    associatedtype T
    var model: T? { get set }
    func configureWithModel(_: T)
    
}
