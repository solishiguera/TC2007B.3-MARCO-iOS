//
//  Extensions.swift
//  Marco
//
//  Created by Andres Piñones on 08/09/21.
//

import UIKit
extension UIViewController{
    func displayAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action =  UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}

extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
         // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
         let layoutManager = NSLayoutManager()
         let textContainer = NSTextContainer(size: CGSize.zero)
         let textStorage = NSTextStorage(attributedString: label.attributedText!)

         // Configure layoutManager and textStorage
         layoutManager.addTextContainer(textContainer)
         textStorage.addLayoutManager(layoutManager)

         // Configure textContainer
         textContainer.lineFragmentPadding = 0.0
         textContainer.lineBreakMode = label.lineBreakMode
         textContainer.maximumNumberOfLines = label.numberOfLines
         let labelSize = label.bounds.size
         textContainer.size = labelSize

         // Find the tapped character location and compare it to the specified range
         let locationOfTouchInLabel = self.location(in: label)
         let textBoundingBox = layoutManager.usedRect(for: textContainer)
         //let textContainerOffset = CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                               //(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
         let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)

         //let locationOfTouchInTextContainer = CGPointMake(locationOfTouchInLabel.x - textContainerOffset.x,
                                                         // locationOfTouchInLabel.y - textContainerOffset.y);
         let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
         let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
         return NSLocationInRange(indexOfCharacter, targetRange)
     }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
