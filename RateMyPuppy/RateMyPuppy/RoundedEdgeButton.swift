import UIKit

@IBDesignable class RoundedEdgeButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultSettings()
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set(newRadius){
            self.layer.cornerRadius = newRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSettings()
    }

    func defaultSettings(){
        self.layer.backgroundColor = UIColor.darkGray.cgColor
        self.setTitleColor(.white, for: .normal)
    }
}
