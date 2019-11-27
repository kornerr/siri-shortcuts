import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.setupAppliances()
        let nc = UINavigationController(rootViewController: self.appliancesVC)
        self.window?.rootViewController = nc

        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()

        return true
    }

    private func LOG(_ message: String)
    {
        NSLog("App \(message)")
    }

    // MARK: - APPLIANCES

    private var appliancesVC: AppliancesVC!
    private var appliancesController: AppliancesController!
    
    private func setupAppliances()
    {
        self.appliancesVC = AppliancesVC()
        self.appliancesVC.title = NSLocalizedString("Appliances.Title", comment: "")

        self.appliancesController = AppliancesController()
        self.appliancesController.itemsChanged.subscribe { [weak self] in
            guard let items = self?.appliancesController.items else { return }
            self?.LOG("Appliances: '\(items)'")
            self?.appliancesVC.items = items
        }

        /*
        // Display image in full screen upon selection.
        // Only for loaded images.
        self.imagesVC.selectedItemIdChanged.subscribe { [weak self] in
            guard
                let imagesVC = self?.imagesVC,
                let imageVC = self?.imageVC,
                let image = imagesVC.images[imagesVC.selectedItemId]
            else
            {
                return
            }

            imageVC.image = image
            imagesVC.show(imageVC, sender: nil)
        }

        // Refresh images.
        self.imagesVC.refreshImages.subscribe { [weak self] in
            self?.imagesController.refresh()
        }

        // Load images the first time.
        self.imagesController.refresh()
        */
    }

}
