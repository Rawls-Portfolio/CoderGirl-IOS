import Foundation

class RateMyPuppyModel {
    var puppyData = PuppyData()
    var currentPuppyIndex: Int = 1
    var favoriteIndex: Int?
    
    var currentPuppy: PuppyObject {
        return puppyData.puppy(at: currentPuppyIndex)
    }
    
    var nextPuppy: PuppyObject {
        currentPuppyIndex += 1
        
        if currentPuppyIndex >= self.puppyData.count {
            currentPuppyIndex = 0
        }
        
        return currentPuppy
    }
    
    var favoritePuppy: PuppyObject? {
        guard let favorite = favoriteIndex else {
            print("We don't have a favorite puppy")
            return nil
        }
        
        return puppyData.puppy(at: favorite)
    }
    
    func rateCurrentPuppy(as rating: Int){
        puppyData.updateRating(of: currentPuppyIndex, to: rating)
        if let favorite = favoriteIndex, currentPuppy.rating > favorite {
            favoriteIndex = currentPuppyIndex
        } else {
            favoriteIndex = currentPuppyIndex
        }
    }
}

protocol PuppyDataDelegate: class {
    func getCurrentPuppy() -> PuppyObject
    func getFavoritePuppy() -> PuppyObject?
}
