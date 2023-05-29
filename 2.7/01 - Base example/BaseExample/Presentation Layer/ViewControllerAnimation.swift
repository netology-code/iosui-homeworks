import UIKit

class ViewControllerAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
    ) -> TimeInterval {
        0.5
    }
    
    func animateTransition(
        using transitionContext: UIViewControllerContextTransitioning
    ) {
        guard
            let sourceViewController = transitionContext.viewController(forKey: .from),
            let tabBarController = sourceViewController.tabBarController,
            let destinationView = transitionContext.view(forKey: .to)
        else { return }
        
        let sourceIndex = tabBarController.viewControllers?.firstIndex(of: sourceViewController) ?? 0
        let destinationIndex = tabBarController.selectedIndex
        
        let direction = (destinationIndex > sourceIndex) ? 1.0 : -1.0
        
        destinationView.transform = CGAffineTransform(
            translationX: direction * destinationView.frame.width,
            y: 0.0
        )
        transitionContext.containerView.addSubview(destinationView)
        
        UIView.animate(
            withDuration: transitionDuration(
                using: transitionContext
            ),
            animations: {
                destinationView.transform = .identity
            },
            completion: {
                transitionContext.completeTransition($0)
            }
        )
    }
}
