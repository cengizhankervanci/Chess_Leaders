//
//  Extentions.swift
//  CheesLeadersMVVM
//
//  Created by Cengizhan Kervancı on 31.05.2023.
//

import Foundation
import UIKit
import Kingfisher

extension UIImage {
  var circleMask: UIImage {
    let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
    let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
      imageView.contentMode = UIView.ContentMode.scaleAspectFill
      imageView.image = self
      imageView.layer.cornerRadius = square.width/2
      imageView.layer.borderColor = UIColor.red.cgColor
      imageView.layer.borderWidth = 5
      imageView.layer.masksToBounds = true
      UIGraphicsBeginImageContext(imageView.bounds.size)
      imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
      let result = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return result!
  }
}
