//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailViewController: UIViewController {
    private let viewModel: PokemonDetailViewModel
    private let disposeBag = DisposeBag()

    // UI
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let idLabel = UILabel()

    init(viewModel: PokemonDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        view.backgroundColor = UIColor(named: "mainRed")
    }

    private func setupUI() {
        view.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        [imageView, nameLabel, idLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
        idLabel.textAlignment = .center

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func bindViewModel() {
        // 간단히 Subject를 통해 포켓몬 정보를 방출한다고 가정
        viewModel.pokemonDetail
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] detail in
                guard let self = self else { return }
                self.nameLabel.text = detail.name.capitalized
                self.idLabel.text = "\(detail.id)"

                if let urlString = detail.imageURL, let url = URL(string: urlString) {
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        guard let data = data else { return }
                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(data: data)
                        }
                    }.resume()
                } else {
                    self.imageView.image = nil
                }
            })
            .disposed(by: disposeBag)

        // viewWillAppear 시점 등에 호출
        viewModel.loadPokemonDetail()
    }
}
