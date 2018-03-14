import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var puppyDetails: UIView!
    @IBOutlet weak var toggleFavorite: UIButton!
    @IBOutlet weak var nextPuppy: UIButton!
    @IBOutlet weak var ratingButtons: UIStackView!
    
    let model: RateMyPuppyModel = RateMyPuppyModel()
    var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super .prepare(for: segue, sender: sender)
        if let puppyView = segue.destination as? PuppyViewController {
            puppyView.delegate = self
        }
        
        toggleButtons()
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
    
    @IBAction func toggleFavorite(_ sender: Any) {
        guard let puppyView = self.childViewControllers.last as? PuppyViewController,
            let favoritePuppy = model.favoritePuppy else {
            print("unable to display next puppy")
            return
        }
        
        toggleButtons()
        puppyView.updatePuppy(with: favoritePuppy)
    }
    
    func toggleButtons(){
        if isFavorite {
            toggleFavorite.setTitle("Continue Rating Puppies", for: .normal)
            nextPuppy.isHidden = true
            ratingButtons.isHidden = true
            isFavorite = false
        } else {
            toggleFavorite.setTitle("Show My Favorite Puppy", for: .normal)
            nextPuppy.isHidden = false
            ratingButtons.isHidden = false
            isFavorite = true
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
