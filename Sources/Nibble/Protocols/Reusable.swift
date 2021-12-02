//
//  Reusable.swift
//  Nibble
//
//  Created by Oleksii Zghurskyi on 24.03.2021.
//  Copyright © 2021 Oleksii Zghurskyi. All rights reserved.
//

import Foundation

public protocol Reusable {
  static var reuseIdentifier: String { get }
  func prepareForReuse()
}

public extension Reusable where Self: AnyObject {
  static var reuseIdentifier: String {
    return try! String(describing: self).substringMatches(regex: "[[:word:]]+").first!
  }
  
  func prepareForReuse() {}
}
