//
//  UICollectionView.swift
//  Nibble
//
//  Created by Oleksii Zghurskyi on 24.03.2021.
//  Copyright © 2021 Oleksii Zghurskyi. All rights reserved.
//

import UIKit

public extension UICollectionView {
  func dequeue<T: UICollectionViewCell & Reusable>(with identifire: String = T.reuseIdentifier, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! T
  }
  
  func register<T: UICollectionViewCell & Reusable>(_ aClass: T.Type, for identifier: String = T.reuseIdentifier) {
    if let aClass = aClass as? NibRepresentable.Type {
      register(aClass.nib, forCellWithReuseIdentifier: identifier)
    } else {
      register(aClass, forCellWithReuseIdentifier: identifier)
    }
  }
}
