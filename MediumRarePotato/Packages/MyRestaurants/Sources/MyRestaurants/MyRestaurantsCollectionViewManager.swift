import UIKit
import UIComponents

class MyRestaurantsCollectionManager: NSObject, UICollectionViewDataSource {

    // Data source array containing the restaurant items
    //var restaurantItems: [Restaurant] = []

    // MARK: UICollectionViewDataSource methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue a reusable cell and set up its contents
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(RestaurantCollectionViewCell.self)", for: indexPath) as? RestaurantCollectionViewCell
        //let restaurant = restaurantItems[indexPath.item]
        guard let cell = cell else {
            fatalError("error")
        }
        return cell
    }
}
