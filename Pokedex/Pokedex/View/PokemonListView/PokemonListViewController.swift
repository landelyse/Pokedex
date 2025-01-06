//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//

import UIKit
import RxSwift
import RxCocoa

final class PokemonListViewController: UIViewController {
    var viewModel: PokemonListViewModel!
    private let disposeBag: DisposeBag = DisposeBag()

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.backgroundColor = UIColor(named: "darkRed")
        view.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.identifier)
        return view
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        bindViewModel()
        collectionView.contentInsetAdjustmentBehavior = .never
    }

    override func viewIsAppearing(_ animated: Bool) {
        viewModel.reloadData()
    }

    // MARK: - Compositional Layout
    private func createLayout() -> UICollectionViewLayout {
        // 아이템(셀) 사이즈: 가로는 섹션 전체폭의 1/3, 세로는 정해진 높이(ex: 150)
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalWidth(1/3)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)

        // 그룹 사이즈(가로 전체 폭, 세로 150)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(150)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // 섹션 생성
        let section = NSCollectionLayoutSection(group: group)

        // 레이아웃
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    // MARK: - Bind
    private func bindViewModel() {
        // 1) 도감 리스트를 컬렉션뷰에 바인딩
        // 간단히 RxSwift의 items(cellIdentifier:) 방식 사용
        viewModel.pokemonList
            .observe(on: MainScheduler.instance)
            .bind(to: collectionView.rx.items(
                cellIdentifier: PokemonCell.identifier,
                cellType: PokemonCell.self)
            ) { _, pokemon, cell in
                cell.configure(with: pokemon)
            }
            .disposed(by: disposeBag)

        // 2) 셀 선택 이벤트 처리
        collectionView.rx.modelSelected(UnlockedPokemon.self)
            .subscribe(onNext: { [weak self] model in
                guard let self = self else { return }
                let detailVM = self.viewModel.detailViewModel(for: model)
                let detailVC = DetailViewController(viewModel: detailVM)
                self.navigationController?.pushViewController(detailVC, animated: true)
            })
            .disposed(by: disposeBag)
    }

    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = UIColor(named: "mainRed")

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = UIColor(named: "mainRed")
        navigationAppearance.shadowImage = nil // 그림자 제거
        navigationController?.navigationBar.standardAppearance = navigationAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationAppearance
    }

    private func setupNavigationBar() {
        navigationItem.title = "Pokedex"
    }
}
