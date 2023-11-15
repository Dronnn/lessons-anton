//
//  ViewController.swift
//  simple-calc
//
//  Created by andrew mayer on 02.11.23.
//

import UIKit
import SnapKit
import EasyPeasy

final class ViewController: UIViewController {

    // MARK: - dependencies

    let presenter: Presenter

    // MARK: - subviews

    let buttonAC = UIButton()
    let buttonPlusMinus = UIButton()
    let buttonPercent = UIButton()
    let buttonDivide = UIButton()
    let buttonMultiply = UIButton()
    let buttonSubtract = UIButton()
    let buttonAdd = UIButton()
    let buttonEquals = UIButton()
    let buttonZero = UIButton()
    let buttonOne = UIButton()
    let buttonTwo = UIButton()
    let buttonThree = UIButton()
    let buttonFour = UIButton()
    let buttonFive = UIButton()
    let buttonSix = UIButton()
    let buttonSeven = UIButton()
    let buttonEight = UIButton()
    let buttonNine = UIButton()
    let buttonDecimal = UIButton()

    var displayView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .gray
        return view
    }()

    var displayLabel = {
        let label = UILabel(frame: .zero)
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()

    // MARK: - life cycle

    init(presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupDisplay()
        setupButtonPlusMinus()
        setupButtonPercent()
        setupButtonAC()
        setupButtonDivide()
        setupButtonMultiply()
        setupButtonSubtract()
        setupButtonAdd()
        setupButtonEquals()
        setupButtonZero()
        setupButtonOne()
        setupButtonTwo()
        setupButtonThree()
        setupButtonFour()
        setupButtonFive()
        setupButtonSix()
        setupButtonSeven()
        setupButtonEight()
        setupButtonNine()
        setupButtonDecimal()
    }

    // MARK: - setup

    private func addSubviews() {
        view.addSubview(displayView)
        view.addSubview(displayLabel)
        view.addSubview(buttonPlusMinus)
        view.addSubview(buttonAC)
        view.addSubview(buttonPercent)
        view.addSubview(buttonDivide)
        view.addSubview(buttonMultiply)
        view.addSubview(buttonSubtract)
        view.addSubview(buttonAdd)
        view.addSubview(buttonEquals)
        view.addSubview(buttonZero)
        view.addSubview(buttonDecimal)
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        view.addSubview(buttonFour)
        view.addSubview(buttonFive)
        view.addSubview(buttonSix)
        view.addSubview(buttonSeven)
        view.addSubview(buttonEight)
        view.addSubview(buttonNine)
    }

    private func setupDisplay() {
        displayView.snp.makeConstraints {
            $0.top.equalTo(0)
            $0.left.equalTo(0)
            $0.right.equalTo(0)
            $0.bottom.equalTo(displayLabel.snp.bottom)

        }
        displayLabel.snp.makeConstraints {
            $0.height.equalTo(75)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(0)
            $0.right.equalTo(-16)
        }
    }

    func setupButtonAC() {
        buttonAC.setTitle("AC", for: .normal)
        buttonAC.backgroundColor = .orange
        buttonAC.layer.borderWidth = 1.0
        buttonAC.layer.borderColor = UIColor.black.cgColor
        buttonAC.addTarget(
            self,
            action: #selector(buttonACPressed),
            for: .touchUpInside
        )
        buttonAC.snp.makeConstraints { make in
            make.top.equalTo(displayView.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.height.equalTo(55)
            make.width.equalTo(view.snp.width).multipliedBy(0.25)
        }
    }

    func setupButtonPlusMinus() {
        buttonPlusMinus.setTitle("+/-", for: .normal)
        buttonPlusMinus.backgroundColor = .orange
        buttonPlusMinus.layer.borderWidth = 1.0
        buttonPlusMinus.layer.borderColor = UIColor.black.cgColor
        buttonPlusMinus.snp.makeConstraints { make in
            make.top.equalTo(displayView.snp.bottom)
            make.left.equalTo(buttonAC.snp.right)
            make.height.equalTo(buttonAC.snp.height)
            make.width.equalTo(buttonAC.snp.width)
        }
    }

    func setupButtonPercent() {
        buttonPercent.setTitle("%", for: .normal)
        buttonPercent.backgroundColor = .orange
        buttonPercent.layer.borderWidth = 1.0
        buttonPercent.layer.borderColor = UIColor.black.cgColor
        buttonPercent.snp.makeConstraints { make in
            make.top.equalTo(displayView.snp.bottom)
            make.left.equalTo(buttonPlusMinus.snp.right)
            make.height.equalTo(buttonPlusMinus.snp.height)
            make.width.equalTo(buttonPlusMinus.snp.width)
        }
    }

    func setupButtonDivide() {
        buttonDivide.setTitle("/", for: .normal)
        buttonDivide.backgroundColor = .orange
        buttonDivide.layer.borderWidth = 1.0
        buttonDivide.layer.borderColor = UIColor.black.cgColor
        buttonDivide.snp.makeConstraints { make in
            make.top.equalTo(buttonAC.snp.top)
            make.left.equalTo(buttonPercent.snp.right)
            make.height.equalTo(buttonAC.snp.height)
            make.width.equalTo(buttonAC.snp.width)
        }
    }

    func setupButtonMultiply() {
        buttonMultiply.setTitle("*", for: .normal)
        buttonMultiply.backgroundColor = .orange
        buttonMultiply.layer.borderWidth = 1.0
        buttonMultiply.layer.borderColor = UIColor.black.cgColor
        buttonMultiply.snp.makeConstraints { make in
            make.top.equalTo(buttonDivide.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(buttonDivide.snp.height)
            make.width.equalTo(buttonDivide.snp.width)
        }
    }

    func setupButtonSubtract() {
        buttonSubtract.setTitle("-", for: .normal)
        buttonSubtract.backgroundColor = .orange
        buttonSubtract.layer.borderWidth = 1.0
        buttonSubtract.layer.borderColor = UIColor.black.cgColor
        buttonSubtract.snp.makeConstraints { make in
            make.top.equalTo(buttonMultiply.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(buttonMultiply.snp.height)
            make.width.equalTo(buttonMultiply.snp.width)
        }
    }

    func setupButtonAdd() {
        buttonAdd.setTitle("+", for: .normal)
        buttonAdd.backgroundColor = .orange
        buttonAdd.layer.borderWidth = 1.0
        buttonAdd.layer.borderColor = UIColor.black.cgColor
        buttonAdd.addTarget(self, action: #selector(buttonPlusPressed), for: .touchUpInside)
        buttonAdd.snp.makeConstraints { make in
            make.top.equalTo(buttonSubtract.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(buttonSubtract.snp.height)
            make.width.equalTo(buttonSubtract.snp.width)
        }
    }

    func setupButtonEquals() {
        buttonEquals.setTitle("=", for: .normal)
        buttonEquals.backgroundColor = .orange
        buttonEquals.layer.borderWidth = 1.0
        buttonEquals.layer.borderColor = UIColor.black.cgColor
        buttonEquals.addTarget(self, action: #selector(buttonEqualPressed), for: .touchUpInside)
        buttonEquals.snp.makeConstraints { make in
            make.top.equalTo(buttonAdd.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(buttonAdd.snp.height)
            make.width.equalTo(buttonAdd.snp.width)
        }
    }

    func setupButtonZero() {
        buttonZero.setTitle("0", for: .normal)
        buttonZero.backgroundColor = .darkGray
        buttonZero.layer.borderWidth = 1.0
        buttonZero.layer.borderColor = UIColor.black.cgColor
        buttonZero.tag = 0
        buttonZero.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        buttonZero.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(buttonEquals.snp.bottom)
            make.height.equalTo(buttonAC.snp.height)
            make.width.equalTo(buttonAC.snp.width).multipliedBy(2)
        }
    }

    func setupButtonDecimal() {
        buttonDecimal.setTitle(",", for: .normal)
        buttonDecimal.backgroundColor = .darkGray
        buttonDecimal.layer.borderWidth = 1.0
        buttonDecimal.layer.borderColor = UIColor.black.cgColor
        buttonDecimal.snp.makeConstraints { make in
            make.bottom.equalTo(buttonEquals.snp.bottom)
            make.left.equalTo(buttonZero.snp.right)
            make.height.equalTo(buttonZero.snp.height)
            make.width.equalTo(buttonAC.snp.width)
        }
    }

    func setupButtonOne() {
        buttonOne.setTitle("1", for: .normal)
        buttonOne.backgroundColor = .darkGray
        buttonOne.layer.borderWidth = 1.0
        buttonOne.layer.borderColor = UIColor.black.cgColor
        buttonOne.tag = 1
        buttonOne.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        buttonOne.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(buttonZero.snp.top)
            make.height.equalTo(buttonZero.snp.height)
            make.width.equalTo(buttonZero.snp.width).multipliedBy(0.5)
        }
    }

    func setupButtonTwo() {
        buttonTwo.setTitle("2", for: .normal)
        buttonTwo.backgroundColor = .darkGray
        buttonTwo.layer.borderWidth = 1.0
        buttonTwo.layer.borderColor = UIColor.black.cgColor
        buttonTwo.tag = 2
        buttonTwo.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        buttonTwo.snp.makeConstraints { make in
            make.left.equalTo(buttonOne.snp.right)
            make.bottom.equalTo(buttonZero.snp.top)
            make.height.equalTo(buttonOne.snp.height)
            make.width.equalTo(buttonOne.snp.width)
        }
    }

    func setupButtonThree() {
        buttonThree.setTitle("3", for: .normal)
        buttonThree.backgroundColor = .darkGray
        buttonThree.layer.borderWidth = 1.0
        buttonThree.layer.borderColor = UIColor.black.cgColor
        buttonThree.tag = 3
        buttonThree.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        buttonThree.snp.makeConstraints { make in
            make.left.equalTo(buttonTwo.snp.right)
            make.bottom.equalTo(buttonZero.snp.top)
            make.height.equalTo(buttonTwo.snp.height)
            make.width.equalTo(buttonTwo.snp.width)
        }
    }

    func setupButtonFour() {
        buttonFour.setTitle("4", for: .normal)
        buttonFour.backgroundColor = .darkGray
        buttonFour.layer.borderWidth = 1.0
        buttonFour.layer.borderColor = UIColor.black.cgColor
        buttonFour.tag = 4
        buttonFour.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        buttonFour.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(buttonOne.snp.top)
            make.height.equalTo(buttonOne.snp.height)
            make.width.equalTo(buttonOne.snp.width)
        }
    }

    func setupButtonFive() {
        buttonFive.setTitle("5", for: .normal)
        buttonFive.backgroundColor = .darkGray
        buttonFive.layer.borderWidth = 1.0
        buttonFive.layer.borderColor = UIColor.black.cgColor
        buttonFive.tag = 5
        buttonFive.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        buttonFive.snp.makeConstraints { make in
            make.left.equalTo(buttonFour.snp.right)
            make.bottom.equalTo(buttonTwo.snp.top)
            make.height.equalTo(buttonFour.snp.height)
            make.width.equalTo(buttonFour.snp.width)
        }
    }

    func setupButtonSix() {
        buttonSix.setTitle("6", for: .normal)
        buttonSix.backgroundColor = .darkGray
        buttonSix.layer.borderWidth = 1.0
        buttonSix.layer.borderColor = UIColor.black.cgColor
        buttonSix.tag = 6
        buttonSix.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        buttonSix.snp.makeConstraints { make in
            make.left.equalTo(buttonFive.snp.right)
            make.bottom.equalTo(buttonThree.snp.top)
            make.height.equalTo(buttonFive.snp.height)
            make.width.equalTo(buttonFive.snp.width)
        }
    }

    func setupButtonSeven() {
        buttonSeven.setTitle("7", for: .normal)
        buttonSeven.backgroundColor = .darkGray
        buttonSeven.layer.borderWidth = 1.0
        buttonSeven.layer.borderColor = UIColor.black.cgColor
        buttonSeven.tag = 7
        buttonSeven.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        buttonSeven.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(buttonFour.snp.top)
            make.height.equalTo(buttonFour.snp.height)
            make.width.equalTo(buttonFour.snp.width)
        }
    }

    func setupButtonEight() {
        buttonEight.setTitle("8", for: .normal)
        buttonEight.backgroundColor = .darkGray
        buttonEight.layer.borderWidth = 1.0
        buttonEight.layer.borderColor = UIColor.black.cgColor
        buttonEight.tag = 8
        buttonEight.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        buttonEight.snp.makeConstraints { make in
            make.left.equalTo(buttonSeven.snp.right)
            make.bottom.equalTo(buttonFive.snp.top)
            make.height.equalTo(buttonSeven.snp.height)
            make.width.equalTo(buttonSeven.snp.width)
        }
    }

    func setupButtonNine() {
        buttonNine.setTitle("9", for: .normal)
        buttonNine.backgroundColor = .darkGray
        buttonNine.layer.borderWidth = 1.0
        buttonNine.layer.borderColor = UIColor.black.cgColor
        buttonNine.tag = 9
        buttonNine.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        buttonNine.snp.makeConstraints { make in
            make.left.equalTo(buttonEight.snp.right)
            make.bottom.equalTo(buttonSix.snp.top)
            make.height.equalTo(buttonEight.snp.height)
            make.width.equalTo(buttonEight.snp.width)
        }
    }

    // MARK: - actions

    @objc
    private func buttonEqualPressed() {
        presenter.operationPressed(.equal)
    }

    @objc
    private func buttonPlusPressed() {
        presenter.operationPressed(.summ)
    }

    @objc
    private func buttonACPressed() {
        presenter.operationPressed(.clear)
    }

    @objc
    private func buttonPressed(_ sender: UIButton) {
        presenter.digitPressed(sender.tag)
    }

    // MARK: - presenter actions

    func setupToDisplay(_ string: String) {
        displayLabel.text = string
    }
}
