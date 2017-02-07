//
//  TableViewDataSource.swift
//  LiftSync
//
//  Created by Anton Dolzhenko on 06.02.17.
//  Copyright © 2017 Onix-Systems. All rights reserved.
//

import UIKit

final class LSTableViewSection: TableViewSection {
    
    var sortOrder: Int = 0
    var items: [LSTableViewCompatible]
    var headerTitle: String?
    var footerTitle: String?
    
    required init(sortOrder: Int, items: [LSTableViewCompatible], headerTitle: String? = nil, footerTitle: String? = nil)  {
        self.sortOrder = sortOrder
        self.items = items
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
    }
    
}

final class LSTableViewDataSource:NSObject, UITableViewDataSource {
    
    var sections = [LSTableViewSection]() {
        didSet {
            sections.sort {
                $0.sortOrder < $1.sortOrder
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].items[indexPath.row]
        return model.cellForTableView(tableView: tableView, atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].headerTitle
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footerTitle
    }
    
}
