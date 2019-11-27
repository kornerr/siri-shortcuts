import Anchorage
import UIKit

class ApplianceVC: UIViewController
{

    private var lastView: UIView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.setupCancellation()
        self.setupApplication()

        self.setupType()

        // Layout.
        self.lastView = startLastView(forVC: self)
        self.layoutType()
        //finishLastView(self.lastView, forVC: self)
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

    // MARK: - TYPE

    private var typeLabel: UILabel!
    private var typeSC: UISegmentedControl!

    private func setupType()
    {
        let items = [
            NSLocalizedString("Type.Kettle", comment: ""),
            NSLocalizedString("Type.CoffeeMachine", comment: ""),
            NSLocalizedString("Type.Multicooker", comment: ""),
        ]
        self.typeSC = UISegmentedControl(items: items)
        self.view.addSubview(self.typeSC)
    }

    private func layoutType()
    {
        self.typeSC.topAnchor == self.lastView.bottomAnchor + 8
        self.typeSC.leftAnchor == self.view.leftAnchor + 8
        self.typeSC.rightAnchor == self.view.rightAnchor - 8

        self.lastView = self.typeSC
    }

}
