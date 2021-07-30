//
//  String+Extensions.swift
//  Novflix
//
//  Created by Tai Phan Van on 30/07/2021.
//

import UIKit

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
