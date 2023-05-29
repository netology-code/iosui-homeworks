import UIKit

class ViewController: UIViewController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarAppearance()
    }
    
    // MARK: - Private
    
    private func setupNavigationBarAppearance() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .systemYellow
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue
        ]
        
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        navigationItem.leftBarButtonItem?.tintColor = .systemBackground
        navigationItem.rightBarButtonItem?.tintColor = .systemBackground
        
        navigationController?.navigationBar.tintColor = .systemBackground
        navigationController?.navigationBar.isTranslucent = false
        
        title = "Test"
        navigationItem.prompt = "Navigation prompts appear at the top"
    }
}
