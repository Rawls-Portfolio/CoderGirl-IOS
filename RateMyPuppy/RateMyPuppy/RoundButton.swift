import UIKit

@IBDesignable class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set(radius) {
            self.layer.cornerRadius = radius
        }
    }
    
    func defaultSettings(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.titleLabel?.textColor = UIColor.purple
        self.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSettings()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultSettings()
    }
}
