// MARK: IMPORT STATEMENTS
import UIKit

// MARK: GRADIENT DIRECTION - ENUM
enum GradientDirection {
    case right
    case left
    case bottom
    case top
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

// MARK: EXTENSION
extension UIView {
    
    // MARK: APPLY GRADIENT - FUNCTION
    func applyGradient(color1: UIColor, color2: UIColor, direction: GradientDirection, cornerRadius: CGFloat? = nil) {
        let gradient = CAGradientLayer()
        
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.bounds.height)
        
        if let cornerRadius = cornerRadius {
            gradient.cornerRadius = cornerRadius
        }
        
        let leftToRight = [CGPoint(x: 0.0, y: 0.0), CGPoint(x: 1.0, y: 0.0)]
        let rightToLeft = [CGPoint(x: 1.0, y: 0.0), CGPoint(x: 0.0, y: 0.0)]
        let topToBottom = [CGPoint(x: 0.0, y: 0.0), CGPoint(x: 0.0, y: 1.0)]
        let bottomToTop = [CGPoint(x: 0.0, y: 1.0), CGPoint(x: 0.0, y: 0.0)]
        let topLeft = [CGPoint(x: 0.0, y: 0.0), CGPoint(x: 1.0, y: 1.0)]
        let topRight = [CGPoint(x: 1.0, y: 0.0), CGPoint(x: 0.0, y: 0.0)]
        let bottomLeft = [CGPoint(x: 1.0, y: 0.0), CGPoint(x: 1.0, y: 0.0)]
        let bottomRight = [CGPoint(x: 0.0, y: 0.0), CGPoint(x: 1.0, y: 1.0)]
        
        switch direction {
        case .right:
            gradient.startPoint = leftToRight[0]
            gradient.endPoint = leftToRight[1]
        case .left:
            gradient.startPoint = rightToLeft[0]
            gradient.endPoint = rightToLeft[1]
        case .bottom:
            gradient.startPoint = topToBottom[0]
            gradient.endPoint = topToBottom[1]
        case .top:
            gradient.startPoint = bottomToTop[0]
            gradient.endPoint = bottomToTop[1]
        case .topLeft:
            gradient.startPoint = topLeft[0]
            gradient.endPoint = topLeft[1]
        case .topRight:
            gradient.startPoint = topRight[0]
            gradient.endPoint = topRight[1]
        case .bottomLeft:
            gradient.startPoint = bottomLeft[0]
            gradient.endPoint = bottomLeft[1]
        case .bottomRight:
            gradient.startPoint = bottomRight[0]
            gradient.endPoint = bottomRight[1]
        }
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}
