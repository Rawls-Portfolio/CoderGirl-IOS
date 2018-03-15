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
        self.layer.backgroundColor = UIColor.darkGray.cgColor
        self.setTitleColor(.white, for: .normal)
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
