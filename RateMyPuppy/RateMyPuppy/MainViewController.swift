import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var puppyDetails: ContainerView!
    @IBOutlet weak var toggleFavorite: UIButton!
    @IBOutlet weak var nextPuppy: UIButton!
    @IBOutlet weak var ratingButtons: UIStackView!
    
    let model: RateMyPuppyModel = RateMyPuppyModel()
    var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        puppyDetails.delegate = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let puppyViewController = storyboard.instantiateViewController(withIdentifier: "puppyView") as? PuppyViewController else {
            print("Unable to instantiate PuppyViewController")
            return
        }
        
        puppyViewController.delegate = self
        puppyDetails.activeViewController = puppyViewController
    }
    
    @IBAction func updateRating(_ sender: UIButton) {
        guard let labelText = sender.titleLabel?.text,
            let rating = Int(labelText) else {
            print("unable to update rating")
            return
        }
        
        model.rateCurrentPuppy(as: rating)
    }

    @IBAction func displayNextPuppy(_ sender: Any) {
        guard let puppyView = self.childViewControllers.last as? PuppyViewController else {
            print("unable to display next puppy")
            return
        }
        
        puppyView.updatePuppy(with: model.nextPuppy)
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch self.childViewControllers.last {
        case let puppyView as PuppyViewController:
            guard let favoriteViewController = storyboard.instantiateViewController(withIdentifier: "favView") as? FavoriteViewController else {
                print("Unable to instantiate FavoriteViewController")
                return
            }
            favoriteViewController.delegate = self
            puppyDetails.activeViewController = favoriteViewController
        case let favoritePuppy as FavoriteViewController:
            guard let puppyViewController = storyboard.instantiateViewController(withIdentifier: "puppyView") as? FavoriteViewController else {
                print("Unable to instantiate FavoriteViewController")
                return
            }
            puppyViewController.delegate = self
            puppyDetails.activeViewController = puppyViewController
        default:
            print("current view is unknown; unable to toggle")
            return
        }
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

// MARK: - Container View Delegate
extension MainViewController: ContainerViewDelegate {
    func addChildToParent(with child: UIViewController) {
        addChildViewController(child)
    }
    
    func notifyDidMoveToParent(with child: UIViewController) {
        child.didMove(toParentViewController: self)
    }
    
}
