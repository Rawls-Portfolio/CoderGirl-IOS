import UIKit

struct PuppyObject {
    let name: String
    let image: String
    let description: String
    let rating: Int
    
    init(name: String, image: String, description: String, rating: Int = 0) {
        self.name = name
        self.image = image
        self.description = description
        self.rating = rating
    }
}

class PuppyData {
    private var allPuppies = [PuppyObject]()
    var count: Int { return allPuppies.count }
    
    init() {
        self.allPuppies = [puppy1, puppy2, puppy3, puppy4, puppy5, puppy6, puppy7, puppy8, puppy9, puppy10, puppy11, puppy12]
    }
    
    func puppy(at index: Int) -> PuppyObject {
        return allPuppies.element(at: index)!
    }
    
    func updateRating(of index: Int, to rating: Int){
        guard let puppyToRate = allPuppies.element(at: index) else {
            print("requested puppy not available for rating")
            return
        }
        
        let newPuppyObject = PuppyObject(name: puppyToRate.name, image: puppyToRate.image, description: puppyToRate.description, rating: rating)
        self.allPuppies.remove(at: index)
        self.allPuppies.insert(newPuppyObject, at: index)
    }
    
    
    //MARK: - default data
    let puppy1 = PuppyObject(name: "Puppy 1", image: "puppy1.jpg", description: "Puppy 1 description")
    let puppy2 = PuppyObject(name: "Puppy 2", image: "puppy2.jpg", description: "Puppy 2 description")
    let puppy3 = PuppyObject(name: "Puppy 3", image: "puppy3.jpg", description: "Puppy 3 description")
    let puppy4 = PuppyObject(name: "Puppy 4", image: "puppy4.jpg", description: "Puppy 4 description")
    let puppy5 = PuppyObject(name: "Puppy 5", image: "puppy5.jpg", description: "Puppy 5 description")
    let puppy6 = PuppyObject(name: "Puppy 6", image: "puppy6.jpg", description: "Puppy 6 description")
    let puppy7 = PuppyObject(name: "Doge/Chihuahua Mix", image: "puppy7.jpg", description: "Loves long naps, barking at squirrels, eating your food. Hates STORMS.")
    let puppy8 = PuppyObject(name: "Puppy 8", image: "puppy8.jpg", description: "Puppy 8 description")
    let puppy9 = PuppyObject(name: "Dachshund", image: "puppy9.jpg", description: "Sleeps all day...all night. Pretty much just a log that barks sometimes.")
    let puppy10 = PuppyObject(name: "Puppy 10", image: "puppy10.jpg", description: "Puppy 10 description")
    let puppy11 = PuppyObject(name: "Puppy 11", image: "puppy11.jpg", description: "Puppy 11 description")
    let puppy12 = PuppyObject(name: "Puppy 12", image: "puppy12.jpg", description: "Puppy 12 description")
}


