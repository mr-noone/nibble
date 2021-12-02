//
//  NibView.swift
//  Nibble
//
//  Created by Oleksii Zghurskyi on 10.11.2020.
//  Copyright © 2021 Oleksii Zghurskyi. All rights reserved.
//

import UIKit

open class NibView: UIView, NibRepresentable, NibLoadable {
  // MARK: - Properties
  
  public private(set) var contentView: UIView!
  
  open class var bundle: Bundle { Bundle(for: self) }
  open class var nibName: String {
    try! String(describing: self).substringMatches(regex: "[[:word:]]+").first!
  }
  
  // MARK: - Inits
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    contentView = loadNib(Self.nib)
    contentViewDidLoad()
  }
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    contentView = loadNib(Self.nib)
    contentViewDidLoad()
  }
  
  // MARK: - Lifecycle
  
  @objc open func contentViewDidLoad() {
    backgroundColor = .clear
  }
}
