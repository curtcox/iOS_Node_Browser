import UIKit

class TextButton : UIButton, Sized, Named {
    
    var size: CGSize { get { return CGSize(width: intrinsicContentSize().width, height:intrinsicContentSize().height) } }
    
    static func create(text: String ) -> TextButton {
        let button = TextButton()
        button.setTitle(text, forState:UIControlState.Normal)
        button.titleLabel?.font = Fonts.size13()
        return button
    }
    
    func setColor(color: UIColor) {
        setTitleColor(color, forState: UIControlState.Normal)
    }
    
    func getName() -> String {
        return currentTitle!
    }
    
}