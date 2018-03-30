//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension NSAttributedString {
    static func kernedSpacedText(_ text: String,
                                    letterSpacing: CGFloat = 0.0,
                                    lineHeight: CGFloat? = nil) -> NSAttributedString {
        // TODO add the font attribute

        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedStringKey.kern,
                                      value: letterSpacing,
                                      range: NSRange(location: 0, length: text.count))

        if let lineHeight = lineHeight {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineHeight

            attributedString.addAttribute(NSAttributedStringKey.paragraphStyle,
                                          value: paragraphStyle,
                                          range: NSRange(location: 0, length: text.count))
        }

        return attributedString
    }
}

//for familyName in UIFont.familyNames {
//    for fontName in UIFont.fontNames(forFamilyName: familyName) {
//        print(fontName)
//    }
//}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let myString = "1⚽📺🍻⚾️🌯🏄‍♂️👍\n2 😀💿💸 🍻"

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 100)
        label.attributedText = NSAttributedString.kernedSpacedText(myString)
        label.numberOfLines = 0
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
