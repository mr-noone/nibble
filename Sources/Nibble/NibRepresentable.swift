//
//  NibRepresentable.swift
//  Nibble
//
//  Created by Aleksey Zgurskiy on 10.11.2020.
//  Copyright © 2020 Aleksey Zgurskiy. All rights reserved.
//

import UIKit

public protocol NibRepresentable {
  static var bundle: Bundle { get }
  static var nibName: String { get }
}

public extension NibRepresentable where Self: AnyObject {
  static var bundle: Bundle {
    Bundle(for: self)
  }
  
  static var nibName: String {
    try! String(describing: self).substringMatches(regex: "[[:word:]]+").first!
  }
}

public extension NibRepresentable {
  static var nib: UINib {
    UINib(nibName: nibName, bundle: bundle)
  }
  
  static var canLoadNib: Bool {
    bundle.url(forResource: nibName, withExtension: "nib") != nil
  }
}
