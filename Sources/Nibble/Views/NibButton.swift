//
//  NibButton.swift
//  Nibble
//
//  Created by Oleksii Zghurskyi on 02.12.2021.
//  Copyright © 2021 Oleksii Zghurskyi. All rights reserved.
//

import UIKit

open class NibButton: NibControl {
  // MARK: - Properties
  
  open override var isEnabled: Bool {
    didSet {
      let alpha: CGFloat = isEnabled ? 1 : 0.2
      contentView.subviews.forEach { $0.alpha = alpha }
    }
  }
  
  open override var isHighlighted: Bool {
    didSet {
      let alpha: CGFloat = isHighlighted ? 0.2 : 1
      let duration: TimeInterval = isHighlighted ? 0.03 : 0.2
      UIView.animate(withDuration: duration) {
        self.contentView.subviews.forEach { $0.alpha = alpha }
      }
    }
  }
}
