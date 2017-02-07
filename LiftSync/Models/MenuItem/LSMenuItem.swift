//
//  MenuItem.swift
//  LiftSync
//
//  Created by Anton Dolzhenko on 06.02.17.
//  Copyright © 2017 Onix-Systems. All rights reserved.
//

import UIKit

struct LSMenuItem {
    var title:String
    
    var controller:(Void)->UIViewController = { _ in return UIViewController() }
}

extension LSMenuItem: LSTableViewCompatible {
    
    var reuseIdentifier: String {
        return "MenuItem"
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = title
        return cell
    }
    
}
