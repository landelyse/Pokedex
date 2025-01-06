//
//  GachaViewController.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//

import UIKit
import RxSwift
import RxCocoa

final class GachaViewController: UIViewController {
    private let viewModel: GachaViewModel = GachaViewModel()
    private let disposeBag: DisposeBag = DisposeBag()
    private let gachaView: GachaView = GachaView()

    var pokemonListViewModel: PokemonListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func bindViewModel() {
        // 트레이너 변경 버튼
        gachaView.changeTrainerButton.rx.tap
            .bind { [weak self ] in
                let newTrainer = self?.gachaView.trainerTextField.text ?? "Red"
                self?.viewModel.updateTrainer(with: newTrainer)
                self?.pokemonListViewModel?.reloadData()
                self?.pokemonListViewModel?.reloadTrigger.onNext(())
                print("change button tabbed: \(newTrainer)")
            }
            .disposed(by: disposeBag
            )
        // 뽑기 버튼
        gachaView.gachaButton.rx.tap
            .bind { [weak self] in
                self?.viewModel.gachaRandomPokemon()
                self?.pokemonListViewModel?.reloadTrigger.onNext(())
            }
            .disposed(by: disposeBag)
        
        // 포켓몬 뽑기
        viewModel.unlockedPokemon
            .observe(on: MainScheduler.instance)// ui >> main thread
            .subscribe(onNext: { [weak self] id in
                self?.gachaView.nameLable.text = String(id)

                guard let url = BaseURL.image(id: id).url else {
                    print("failed to build image url")
                    return
                }
                URLSession.shared.dataTask(with: url) { data, _, _ in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self?.gachaView.pokemonImage.image = UIImage(data: data)
                    }
                }.resume()
            })
            .disposed(by: disposeBag)
    }

    private func setupUI() {
        view.backgroundColor = UIColor(named: "mainRed")

        view.addSubview(gachaView)
        gachaView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gachaView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gachaView.topAnchor.constraint(equalTo: view.topAnchor),
            gachaView.widthAnchor.constraint(equalTo: view.widthAnchor),
            gachaView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }

}
