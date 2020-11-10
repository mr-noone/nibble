//
//  NibView.swift
//  Nibble
//
//  Created by Aleksey Zgurskiy on 10.11.2020.
//  Copyright © 2020 Aleksey Zgurskiy. All rights reserved.
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
    viewDidLoad()
  }
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    contentView = loadNib(Self.nib)
    viewDidLoad()
  }
  
  // MARK: - Lifecycle
  
  @objc open func viewDidLoad() {}
}
