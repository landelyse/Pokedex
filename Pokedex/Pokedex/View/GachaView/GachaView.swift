//
//  GachaView.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//

import UIKit

final class GachaView: UIView {
    let trainerTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "enter trainer"
        field.borderStyle = .roundedRect
        field.autocapitalizationType = .none
        field.backgroundColor = UIColor(named: "cellBackground")
        return field
    }()
    let gachaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Gacha!", for: .normal)
        button.backgroundColor = UIColor(named: "darkRed")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    let changeTrainerButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Change", for: .normal)
           button.backgroundColor = .systemBlue
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 5
           return button
       }()

    let nameLable: UILabel = {
        let label = UILabel()
        label.text = "Pokemon Name"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        return label
    }()

    let pokemonImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor(named: "cellBackground")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupUI() {
        [trainerTextField,changeTrainerButton,gachaButton, nameLable, pokemonImage].forEach { view in
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
                    trainerTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                    trainerTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
                    trainerTextField.widthAnchor.constraint(equalToConstant: 150),
                    trainerTextField.heightAnchor.constraint(equalToConstant: 40),

                    changeTrainerButton.leadingAnchor.constraint(equalTo: trainerTextField.trailingAnchor, constant: 10),
                    changeTrainerButton.centerYAnchor.constraint(equalTo: trainerTextField.centerYAnchor),
                    changeTrainerButton.widthAnchor.constraint(equalToConstant: 80),
                    changeTrainerButton.heightAnchor.constraint(equalToConstant: 40),

                    gachaButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                    gachaButton.topAnchor.constraint(equalTo: trainerTextField.bottomAnchor, constant: 20),
                    gachaButton.widthAnchor.constraint(equalToConstant: 150),
                    gachaButton.heightAnchor.constraint(equalToConstant: 50),

                    nameLable.topAnchor.constraint(equalTo: gachaButton.bottomAnchor, constant: 30),
                    nameLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),

                    pokemonImage.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 20),
                    pokemonImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                    pokemonImage.widthAnchor.constraint(equalToConstant: 200),
                    pokemonImage.heightAnchor.constraint(equalToConstant: 200)
                ])
    }
}
