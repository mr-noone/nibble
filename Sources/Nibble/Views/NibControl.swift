//
//  NibControl.swift
//  Nibble
//
//  Created by Aleksey Zgurskiy on 10.11.2020.
//  Copyright © 2020 Aleksey Zgurskiy. All rights reserved.
//

import UIKit

open class NibControl: UIControl, NibRepresentable, NibLoadable {
  // MARK: - Properties
  
  public private(set) var contentView: UIView!
  
  open class var bundle: Bundle { Bundle(for: self) }
  open class var nibName: String {
    try! String(describing: self).substringMatches(regex: "[[:word:]]+").first!
  }
  
  open override var backgroundColor: UIColor? {
    get { contentView?.backgroundColor }
    set { contentView?.backgroundColor = newValue }
  }
  
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
  
  // MARK: - Inits
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    contentView = loadNib(type(of: self).nib)
    contentView.isUserInteractionEnabled = false
    viewDidLoad()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    contentView = loadNib(type(of: self).nib)
    contentView.isUserInteractionEnabled = false
    viewDidLoad()
  }
  
  // MARK: - Lifecycle
  
  @objc open func viewDidLoad() {
    super.backgroundColor = .clear
  }
}
