//
//  PokemonCell.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//

import UIKit

final class PokemonCell: UICollectionViewCell {
    static let identifier = "PokemonCell"

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor(named: "cellBackground")
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupSubviews() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            imageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    func configure(with pokemon: UnlockedPokemon) {
        // TODO: Image manager 만들어야 함
        if let url = BaseURL.image(id: Int(pokemon.id)).url {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}
