//
//  NSObject+Extensions.swift
//  Alto
//
//  Created by Vik Denic on 1/16/18.
//  Copyright © 2018 nekturlabs. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
