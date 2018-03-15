import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var puppyDetail: ContainerView!
    @IBOutlet weak var toggleView: UIButton!
    
    let model: RateMyPuppyModel = RateMyPuppyModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        puppyDetail.delegate = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let puppyView = storyboard.instantiateViewController(withIdentifier: "puppyView") as! PuppyViewController
        puppyView.delegate = self
        puppyDetail.activeViewController = puppyView
    }
    
    
    @IBAction func toggleViewPressed(_ sender: Any) {
        
        switch puppyDetail.activeViewController {
        case let x where x is PuppyViewController:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let favView = storyboard.instantiateViewController(withIdentifier: "favView") as! FavoriteViewController
            // favView.delegate = self
            puppyDetail.activeViewController = favView
        case let x where x is FavoriteViewController:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let puppyView = storyboard.instantiateViewController(withIdentifier: "puppyView") as! PuppyViewController
            puppyView.delegate = self
            puppyDetail.activeViewController = puppyView
        default:
            return
        }
        
    }
    
    @IBAction func displayNextPuppy(_ sender: Any) {
        switch puppyDetail.activeViewController{
        case let puppyView as PuppyViewController:
            puppyView.updatePuppy(with: model.nextPuppy)
        default: return
        }
    }
}

// MARK: - Container View Delegate Methods
extension MainViewController: ContainerViewDelegate {
    func addChildToParent(with child: UIViewController) {
        addChildViewController(child)
    }
    
    func notifyDidMoveToParent(with child: UIViewController) {
        child.didMove(toParentViewController: self)
    }
}

// MARK: - Puppy Data Delegate
extension MainViewController: PuppyDataDelegate {
    func getCurrentPuppy() -> PuppyObject {
        return model.currentPuppy
    }
    
    func getFavoritePuppy() -> PuppyObject? {
        return model.favoritePuppy
    }
    
    
}
