

import UIKit

struct Const {
    
    static let leading: CGFloat = 16
    static let trailing: CGFloat = -16
    static let indent: CGFloat = 16
}

public extension UIView {

    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }



func addSubviews(_ subviews: UIView...) {
    subviews.forEach { addSubview($0) }
}
}
