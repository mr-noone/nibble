//
//  UITableView.swift
//  Nibble
//
//  Created by Oleksii Zghurskyi on 24.03.2021.
//  Copyright © 2021 Oleksii Zghurskyi. All rights reserved.
//

import UIKit

public extension UITableView {
  func dequeue<T: UITableViewCell & Reusable>(with identifire: String = T.reuseIdentifier, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! T
  }
  
  func register<T: UITableViewCell & Reusable>(_ aClass: T.Type, for identifier: String = T.reuseIdentifier) {
    if let aClass = aClass as? NibRepresentable.Type {
      register(aClass.nib, forCellReuseIdentifier: identifier)
    } else {
      register(aClass, forCellReuseIdentifier: identifier)
    }
  }
}
