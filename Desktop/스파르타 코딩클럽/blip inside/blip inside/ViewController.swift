

import UIKit

class ReminderListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    
    var dataSource: DataSource!
    
    
    
    @IBOutlet weak var MainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        //ViewController가 뷰 계층을 메모리에서 로드한 후 시스템은 viewDidLoad()를 호출
        collectionView.collectionViewLayout = listLayout
        //listLayout을 collection view layout에 할당함
        
        //새로운 셀 등록 생성( 셀 등록은 셀의 내용과 모양을 구성하는 방법 지정
        let cellRegistration = UICollectionView.CellRegistration {
            (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            
            contentConfiguration.text = reminder.title
            cell.contentConfiguration = contentConfiguration
            
        }
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        var reminderTitles = [String]()
        for reminder in Reminder.sampleData {
            reminderTitles.append(reminder.title)
        }
        snapshot.appendItems(reminderTitles)
        
        dataSource.apply(snapshot)
        
        collectionView.dataSource = dataSource
    }
    //그룹화된 모양을 가진 새로운 목록 구성 변수를 생성하는 함수
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        
        listConfiguration.showsSeparators = false //구분 선 안 보이게
        listConfiguration.backgroundColor = .clear //배경 안 보이게
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
        //listCofiguration을 이용해 UICollectionViewCompositionalLayout 반환
    }
   


}

