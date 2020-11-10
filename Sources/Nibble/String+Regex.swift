//
//  String+Regex.swift
//  Nibble
//
//  Created by Aleksey Zgurskiy on 10.11.2020.
//  Copyright © 2020 Aleksey Zgurskiy. All rights reserved.
//

import Foundation

extension String {
  func substringMatches(regex: String) throws -> [String] {
    let regex = try NSRegularExpression(pattern: regex, options: [])
    let range = NSMakeRange(0, (self as NSString).length)
    let matches = regex.matches(in: self, options: [], range: range)
    
    let string = self as NSString
    var substrings = [String]()
    for match in matches {
      substrings.append(string.substring(with: match.range) as String)
    }
    
    return substrings
  }
}
