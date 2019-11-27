import UIKit

class ApplianceVC: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupCancellation()
        self.setupApplication()
    }

    private func LOG(_ message: String)
    {
        NSLog("ApplianceVC \(message)")
    }

    // MARK: - CANCELLATION

    let cancel = Reporter()
    private var cancelButton: UIBarButtonItem!

    private func setupCancellation()
    {
        self.cancelButton =
            UIBarButtonItem(
                barButtonSystemItem: .cancel,
                target: self,
                action: #selector(requestCancellation)
            )
        var items: [UIBarButtonItem] = self.navigationItem.leftBarButtonItems ?? []
        items.append(self.cancelButton)
        self.navigationItem.leftBarButtonItems = items
    }

    @objc func requestCancellation(_ sender: Any)
    {
        self.cancel.report()
    }

    // MARK: - APPLICATION

    let apply = Reporter()
    private var applyButton: UIBarButtonItem!

    private func setupApplication()
    {
        self.applyButton =
            UIBarButtonItem(
                barButtonSystemItem: .done,
                target: self,
                action: #selector(requestApplication)
            )
        var items: [UIBarButtonItem] = self.navigationItem.rightBarButtonItems ?? []
        items.append(self.applyButton)
        self.navigationItem.rightBarButtonItems = items
    }

    @objc func requestApplication(_ sender: Any)
    {
        self.apply.report()
    }
}
