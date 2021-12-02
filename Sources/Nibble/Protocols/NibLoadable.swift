//
//  NibLoadable.swift
//  Nibble
//
//  Created by Oleksii Zghurskyi on 10.11.2020.
//  Copyright © 2021 Oleksii Zghurskyi. All rights reserved.
//

import UIKit

public protocol NibLoadable where Self: NibRepresentable {
  func loadNib(_ nib: UINib) -> UIView?
}

public extension NibLoadable where Self: UIView {
  @discardableResult
  func loadNib(_ nib: UINib) -> UIView? {
    guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
    else { return nil }
    
    addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .clear
    view.frame = bounds
    
    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: topAnchor, constant: 0),
      view.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
      rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
      bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
    ])
    
    return view
  }
}
