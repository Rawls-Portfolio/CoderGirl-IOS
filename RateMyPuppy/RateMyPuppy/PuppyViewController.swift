import UIKit

class PuppyViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    weak var delegate: PuppyDataDelegate?
    private var currentPuppy: PuppyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentPuppy = delegate?.getCurrentPuppy() else {
            print("Unable to get current puppy")
            return
        }
        
        imageView.image = UIImage.init(named: currentPuppy.image)
    }
    
    func updatePuppy(with puppy: PuppyObject) {
        self.currentPuppy = puppy
        imageView.image = UIImage.init(named: currentPuppy!.image)
    }
}
