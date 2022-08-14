//
//  Extension+UIView.swift
//  Instagram
//
//  Created by Nathaniel Whittington on 8/14/22.
//

import Foundation
import UIKit

extension UIView{
    
    public var width: CGFloat{
        return frame.size.width
    }
    
    public var heigt: CGFloat{
        return frame.size.height
    }
    
    public var top: CGFloat{
        return frame.origin.y
    }
    
    public var bottom: CGFloat{
        return frame.origin.y + frame.size.height
    }
    
    public var left: CGFloat{
        return frame.origin.x
    }
    
    public var rigth: CGFloat{
        return frame.origin.x + frame.self.width
    }
}
