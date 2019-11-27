import UIKit

class AppliancesVC: UIViewController
    ,UITableViewDataSource
//    ,UITableViewDelegate
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupTableView()
        
        self.tableView.register(Cell.self, forCellReuseIdentifier: self.CELL_ID)
        
        /*

        // Images.
        self.itemsChanged.subscribe { [weak self] in
            self?.downloadItemImages()
        }
        self.imagesChanged.subscribe { [weak self] in
            self?.applyItemImages()
        }

        // Selection.
        self.collectionView.delegate = self

        self.setupRefreshImages()
        */
    }

    private func LOG(_ message: String)
    {
        NSLog("AppliancesVC \(message)")
    }

    // MARK: - ITEMS

    var items = [Appliance]()
    {
        didSet
        {
            self.itemsChanged.report()
        }
    }
    let itemsChanged = Reporter()

    // MARK: - TABLE VIEW

    private var tableView: UITableView!

    private func setupTableView()
    {
        self.tableView = UITableView(frame: .zero, style: .plain)
        self.view.embeddedView = self.tableView
        self.tableView.backgroundColor = .clear
        self.tableView.dataSource = self
    
        // Refresh on changes.
        self.itemsChanged.subscribe { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return self.items.count
    }
    
    func tableView(
       _ tableView: UITableView,
       cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        return self.cell(forItemAt: indexPath)
    }

    // MARK: - TODO IMAGES

    //private var dequeued = [CellView : Int]()

    // MARK: - CELL

    private let CELL_ID = "CELL_ID"
    private typealias Cell = UITableViewCell
    //private typealias CellView = UIImageView
    //private typealias Cell = UICollectionViewCellTemplate<CellView>
    
    private func cell(forItemAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell =
            self.tableView.dequeueReusableCell(
                withIdentifier: self.CELL_ID,
                for: indexPath
            )
        let index = indexPath.row
        let item = self.items[index]
        cell.textLabel?.text = item.type.rawValue
        //self.dequeued[cell.view] = index
        
        return cell
    }

    /*
    // MARK: - SELECTION

    var selectedItemId: Int = 0
    {
        didSet
        {
            self.selectedItemIdChanged.report()
        }
    }
    let selectedItemIdChanged = Reporter()

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        self.selectedItemId = indexPath.row
    }
    */

    // MARK: - REFRESH IMAGES

    /*
    let refreshImages = Reporter()
    private var refreshButton: UIBarButtonItem!

    private func setupRefreshImages()
    {
        self.refreshButton =
            UIBarButtonItem(
                barButtonSystemItem: .refresh,
                target: self,
                action: #selector(requestRefreshImages)
            )
        var items: [UIBarButtonItem] = self.navigationItem.rightBarButtonItems ?? []
        items.append(self.refreshButton)
        self.navigationItem.rightBarButtonItems = items
    }

    @objc func requestRefreshImages(_ sender: Any)
    {
        self.refreshImages.report()
    }
 */
}
