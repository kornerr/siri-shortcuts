import UIKit

class AppliancesVC: UIViewController
//    ,UICollectionViewDataSource
//    ,UICollectionViewDelegate
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        /*
        self.setupCollectionView()
        self.collectionView.register(
           Cell.self,
           forCellWithReuseIdentifier: self.CELL_ID
        )

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

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        //self.configureLayoutInsets()
    }

    private func LOG(_ message: String)
    {
        NSLog("AppliancesVC \(message)")
    }

    // MARK: - ITEMS

    var items = [String]()
    {
        didSet
        {
            self.itemsChanged.report()
        }
    }
    let itemsChanged = Reporter()

    /*
    // MARK: - COLLECTION VIEW

    private let ITEM_INSET_MIN: CGFloat = 15
    private let ITEM_WIDTH: CGFloat = 140
    private let ITEM_HEIGHT: CGFloat = 140

    private var collectionView: UICollectionView!
    private var layout: UICollectionViewFlowLayout!

    private func setupCollectionView()
    {
        self.layout = UICollectionViewFlowLayout()
        self.collectionView =
            UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        self.view.embeddedView = self.collectionView
        self.collectionView.backgroundColor = .clear
        self.collectionView.dataSource = self
    
        // Refresh on changes.
        self.itemsChanged.subscribe { [weak self] in
            self?.collectionView.reloadData()
        }
    
        // Set stub size initially so that cells are invisible before changes.
        self.layout.itemSize = CGSize(width: 1, height: 1)
        self.itemsChanged.subscribe { [weak self] in
            self?.configureItemSize()
        }
    }
    
    private func configureItemSize()
    {
        let itemSize = CGSize(width: self.ITEM_WIDTH, height: self.ITEM_HEIGHT)
        self.layout.itemSize = itemSize
    }

    private func configureLayoutInsets()
    {
        // Find out the number of items fitting into single row
        // with default insets.
        let width = self.collectionView.frame.size.width
        let insetWidth = width - self.ITEM_INSET_MIN * 2 /* left + right edges */
        let itemsCount = floor(insetWidth / self.ITEM_WIDTH)
    
        // Find out overall free width not occupied by items.
        let occupiedWidth = itemsCount * self.ITEM_WIDTH
        let freeWidth = width - occupiedWidth
        let freeSlotsCount = itemsCount + 1
    
        // Find out width to equalize free slots.
        let slotWidth = freeWidth / freeSlotsCount
        // Use this width for insets.
        let inset = slotWidth
        self.layout.sectionInset =
            UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return self.items.count
    }
    
    func collectionView(
       _ collectionView: UICollectionView,
       cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return self.cell(forItemAt: indexPath)
    }

    // MARK: - IMAGES

    private var dequeued = [CellView : Int]()
    private(set) var images = [Int : UIImage]()
    let imagesChanged = Reporter()

    private func downloadItemImages()
    {
        self.images = [ : ]

        for (id, url) in self.items.enumerated()
        {
            Alamofire.request(url).responseImage { response in
                // Make sure image exists.
                guard let image = response.result.value else { return }
    
                DispatchQueue.main.async { [weak self] in
                    //self?.LOG("downloadItemImages finished for id: '\(id)'")
                    self?.images[id] = image
                    self?.imagesChanged.report()
                }
            }
        }
    }

    private func applyItemImages()
    {
        for (itemView, id) in self.dequeued
        {
            if let image = self.images[id]
            {
                itemView.image = image
            }
        }
    }

    // MARK: - CELL

    private let CELL_ID = "CELL_ID"
    private typealias CellView = UIImageView
    private typealias Cell = UICollectionViewCellTemplate<CellView>
    
    private func cell(forItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell =
            self.collectionView.dequeueReusableCell(
                withReuseIdentifier: self.CELL_ID,
                for: indexPath
            )
            as! Cell
        let index = indexPath.row

        cell.itemView.backgroundColor = .gray
        cell.itemView.contentMode = .scaleAspectFill
        cell.itemView.clipsToBounds = true

        cell.itemView.image = self.images[index]
        self.dequeued[cell.itemView] = index
        
        return cell
    }

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

    // MARK: - REFRESH IMAGES

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
