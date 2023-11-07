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

    let presenter: Presenter

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
    }

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
        buttonAC.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.snp.left)
            make.height.equalTo(buttonPercent.snp.height)
            make.width.equalTo(view.snp.width).multipliedBy(0.25) // assuming you have a 4 column layout
        }
    }

    func setupButtonPlusMinus() {
        buttonPlusMinus.setTitle("+/-", for: .normal)
        buttonPlusMinus.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(buttonAC.snp.right)
            make.height.equalTo(buttonAC.snp.height)
            make.width.equalTo(buttonAC.snp.width)
        }
    }

    func setupButtonPercent() {
        buttonPercent.setTitle("%", for: .normal)
        buttonPercent.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(buttonPlusMinus.snp.right)
            make.height.equalTo(buttonPlusMinus.snp.height)
            make.width.equalTo(buttonPlusMinus.snp.width)
        }
    }

    func setupButtonDivide() {
        buttonDivide.setTitle("/", for: .normal)

        buttonDivide.snp.makeConstraints { make in
            make.top.equalTo(buttonAC.snp.top)
            make.left.equalTo(buttonPercent.snp.right)
            make.height.equalTo(buttonAC.snp.height)
            make.width.equalTo(buttonAC.snp.width)
        }
    }

    func setupButtonMultiply() {
        buttonMultiply.setTitle("X", for: .normal)

        buttonMultiply.snp.makeConstraints { make in
            make.top.equalTo(buttonDivide.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(buttonDivide.snp.height)
            make.width.equalTo(buttonDivide.snp.width)
        }
    }

    func setupButtonSubtract() {
        buttonSubtract.setTitle("-", for: .normal)
        buttonSubtract.snp.makeConstraints { make in
            make.top.equalTo(buttonMultiply.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(buttonMultiply.snp.height)
            make.width.equalTo(buttonMultiply.snp.width)
        }
    }

    func setupButtonAdd() {
        buttonAdd.setTitle("+", for: .normal)
        buttonAdd.snp.makeConstraints { make in
            make.top.equalTo(buttonSubtract.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(buttonSubtract.snp.height)
            make.width.equalTo(buttonSubtract.snp.width)
        }
    }

    func setupButtonEquals() {
        buttonEquals.setTitle("=", for: .normal)
        buttonEquals.snp.makeConstraints { make in
            make.top.equalTo(buttonAdd.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(buttonAdd.snp.height)
            make.width.equalTo(buttonAdd.snp.width)
        }
    }

    func setupButtonZero() {
        buttonZero.setTitle("0", for: .normal)
        buttonZero.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(buttonAC.snp.height)
            make.width.equalTo(buttonAC.snp.width).multipliedBy(2) // double width for the zero button
        }
    }

    func setupButtonDecimal() {
        buttonDecimal.setTitle(",", for: .normal)

        buttonDecimal.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(buttonZero.snp.right)
            make.height.equalTo(buttonZero.snp.height)
            make.width.equalTo(buttonAC.snp.width)
        }
    }

    func setupButtonOne() {
        buttonOne.setTitle("1", for: .normal)
        buttonOne.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(buttonZero.snp.top)
            make.height.equalTo(buttonZero.snp.height)
            make.width.equalTo(buttonZero.snp.width).multipliedBy(0.5) // since zero is double width
        }
    }

    func setupButtonTwo() {
        buttonTwo.setTitle("2", for: .normal)
        buttonTwo.snp.makeConstraints { make in
            make.left.equalTo(buttonOne.snp.right)
            make.bottom.equalTo(buttonZero.snp.top)
            make.height.equalTo(buttonOne.snp.height)
            make.width.equalTo(buttonOne.snp.width)
        }
    }

    func setupButtonThree() {
        buttonThree.setTitle("3", for: .normal)
        buttonThree.snp.makeConstraints { make in
            make.left.equalTo(buttonTwo.snp.right)
            make.bottom.equalTo(buttonZero.snp.top)
            make.height.equalTo(buttonTwo.snp.height)
            make.width.equalTo(buttonTwo.snp.width)
        }
    }

    func setupButtonFour() {
        buttonFour.setTitle("4", for: .normal)
        buttonFour.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(buttonOne.snp.top)
            make.height.equalTo(buttonOne.snp.height)
            make.width.equalTo(buttonOne.snp.width)
        }
    }

    func setupButtonFive() {
        buttonFive.setTitle("5", for: .normal)
        buttonFive.snp.makeConstraints { make in
            make.left.equalTo(buttonFour.snp.right)
            make.bottom.equalTo(buttonTwo.snp.top)
            make.height.equalTo(buttonFour.snp.height)
            make.width.equalTo(buttonFour.snp.width)
        }
    }

    func setupButtonSix() {
        buttonSix.setTitle("6", for: .normal)
        buttonSix.snp.makeConstraints { make in
            make.left.equalTo(buttonFive.snp.right)
            make.bottom.equalTo(buttonThree.snp.top)
            make.height.equalTo(buttonFive.snp.height)
            make.width.equalTo(buttonFive.snp.width)
        }
    }

    // Button Seven, Eight, Nine
    func setupButtonSeven() {
        buttonSeven.setTitle("7", for: .normal)
        buttonSeven.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(buttonFour.snp.top)
            make.height.equalTo(buttonFour.snp.height)
            make.width.equalTo(buttonFour.snp.width)
        }
    }

    func setupButtonEight() {
        buttonEight.setTitle("8", for: .normal)
        buttonEight.snp.makeConstraints { make in
            make.left.equalTo(buttonSeven.snp.right)
            make.bottom.equalTo(buttonFive.snp.top)
            make.height.equalTo(buttonSeven.snp.height)
            make.width.equalTo(buttonSeven.snp.width)
        }
    }

    func setupButtonNine() {
        buttonNine.setTitle("9", for: .normal)
        buttonNine.snp.makeConstraints { make in
            make.left.equalTo(buttonEight.snp.right)
            make.bottom.equalTo(buttonSix.snp.top)
            make.height.equalTo(buttonEight.snp.height)
            make.width.equalTo(buttonEight.snp.width)
        }
    }

    private func buttonEqualPressed() {
//        presenter
    }
}
