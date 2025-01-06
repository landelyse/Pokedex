//
//  TabBarViewController.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//

import UIKit

final class TabBarController: UITabBarController {
    private let gachaVC = GachaViewController()
    private let listVC = PokemonListViewController()

    private let pokemonListViewModel: PokemonListViewModel = PokemonListViewModel()

    private let pokemonBallImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "pokemonBall"))
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    private let imageSize: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSafeAreaBackground()
        setupTabBar()
        setupPokemonBallImage()
        adjustViewControllerInsets()

    }
    private func setupUI() {
        view.backgroundColor = UIColor(named: "mainRed")

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(named: "mainRed")
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance

    }
    private func setupTabBar() {
        gachaVC.tabBarItem = UITabBarItem(
            title: "gacha",
            image: UIImage(systemName: "gift"),
            selectedImage: UIImage(systemName: "gift.fill")
        )

        listVC.tabBarItem = UITabBarItem(
            title: "list",
            image: UIImage(systemName: "book"),
            selectedImage: UIImage(systemName: "book.fill")
        )

        viewControllers = [
            gachaVC,
            UINavigationController(rootViewController: listVC)
        ]

        gachaVC.pokemonListViewModel = pokemonListViewModel
        listVC.viewModel = pokemonListViewModel
    }

    // 탭 바에서 접근하는 뷰컨 상단에 동일하게 이미지를 띄워두기 위해 탭 바에서 이미지 뷰 설정
    private func setupPokemonBallImage() {
        view.addSubview(pokemonBallImageView)
        pokemonBallImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pokemonBallImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonBallImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pokemonBallImageView.widthAnchor.constraint(equalToConstant: imageSize),
            pokemonBallImageView.heightAnchor.constraint(equalToConstant: imageSize)
        ])
    }

    private func setupSafeAreaBackground() {
        let topBackgroundView = UIView()
        topBackgroundView.backgroundColor = UIColor(named: "mainRed")
        topBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topBackgroundView)

        NSLayoutConstraint.activate([
            topBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            topBackgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    private func adjustViewControllerInsets() {
        let height = imageSize + 10
        viewControllers?.forEach({ viewController in
            viewController.additionalSafeAreaInsets.top = height
        })
    }
}
