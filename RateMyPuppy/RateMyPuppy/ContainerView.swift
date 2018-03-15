import UIKit

protocol ContainerViewDelegate: class {
    func addChildToParent(with child: UIViewController)
    func notifyDidMoveToParent(with child: UIViewController)
}

class ContainerView: UIView {
    weak var delegate: ContainerViewDelegate?
    var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(oldValue)
            updateActiveViewController()
        }
    }
    
    private func removeInactiveViewController(_ inactiveViewController: UIViewController?) {
        if let inactiveVC = inactiveViewController {
            inactiveVC.willMove(toParentViewController: nil)
            inactiveVC.view.removeFromSuperview()
            inactiveVC.removeFromParentViewController()
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            delegate?.addChildToParent(with: activeVC)
            activeVC.view.frame = bounds
            addSubview(activeVC.view)
            delegate?.notifyDidMoveToParent(with: activeVC)
        }
    }
}

