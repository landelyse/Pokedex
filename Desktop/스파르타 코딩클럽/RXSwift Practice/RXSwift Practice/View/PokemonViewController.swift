//
//  PokemonViewController.swift
//  RXSwift Practice
//
//  Created by 박진홍 on 1/2/25.
//

import UIKit
import RxSwift
import RxCocoa

final class PokemonViewController: UIViewController {
    // MARK: - UI Components
        private let fetchButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Fetch Pokemon", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Press button to fetch!"
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .darkGray
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let spriteImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    // MARK: - ViewModel
        // ViewModel을 외부에서 주입(Dependency Injection)받아도 되고,
        // 간단히 내부에서 생성해도 됩니다.
        private let viewModel = PokemonViewModel()
        
        // MARK: - DisposeBag
        private let disposeBag = DisposeBag()
        
        // MARK: - Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .white
            setupLayout()
            bindViewModel()
        }
    // MARK: - Layout
        private func setupLayout() {
            view.addSubview(fetchButton)
            view.addSubview(nameLabel)
            view.addSubview(spriteImageView)
            
            NSLayoutConstraint.activate([
                fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                fetchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
                
                nameLabel.topAnchor.constraint(equalTo: fetchButton.bottomAnchor, constant: 20),
                nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                spriteImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                spriteImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                spriteImageView.widthAnchor.constraint(equalToConstant: 500),
                spriteImageView.heightAnchor.constraint(equalToConstant: 500)
            ])
        }
        
        // MARK: - Bind ViewModel
        private func bindViewModel() {
            /*
             1) fetchButton 탭 이벤트 -> ViewModel의 fetchTrigger로 전달
             2) ViewModel에서 나온 pokemon Observable 구독 -> nameLabel, spriteImageView 갱신
            */
            
            // 1) Input: 버튼 탭 -> fetchTrigger.onNext()
            fetchButton.rx.tap
                .bind(to: viewModel.fetchTrigger)
                .disposed(by: disposeBag)
            
            // 2) Output: pokemon Observable
            viewModel.pokemon
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { [weak self] pokemon in
                    guard let self = self else { return }
                    
                    // (a) 라벨에 포켓몬 이름 표시
                    self.nameLabel.text = "Name: \(pokemon.name.capitalized) #\(pokemon.id)"
                    
                    // (b) 포켓몬 이미지 로드
                    guard !pokemon.sprites.frontDefault.isEmpty,
                          let url = URL(string: pokemon.sprites.frontDefault) else {
                        self.spriteImageView.image = nil
                        return
                    }
                    
                    // RxCocoa 제공: URLSession + data() Observable
                    URLSession.shared.rx.data(request: URLRequest(url: url))
                        .observeOn(MainScheduler.instance)
                        .subscribe(onNext: { data in
                            self.spriteImageView.image = UIImage(data: data)
                        }, onError: { error in
                            // 이미지 로딩 실패할 경우 에러 처리
                            print("Image load error:", error.localizedDescription)
                            self.spriteImageView.image = nil
                        })
                        .disposed(by: self.disposeBag)
                }, onError: { error in
                    // 포켓몬 불러오기 실패 시
                    print("Fetch Pokemon Error:", error.localizedDescription)
                })
                .disposed(by: disposeBag)
        }
}
