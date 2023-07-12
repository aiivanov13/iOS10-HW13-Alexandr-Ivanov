//
//  Model.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 24.06.2023.
//

import UIKit

enum OptionType {
    case switched
    case described(state: Description?)
    case general
    
    enum Description: String {
        case on = "Вкл."
        case off = "Выкл."
        case notConnected = "Не подключено"
    }
}

struct Option {
    var image: UIImage
    var name: String
    var iconBackgroundColor: UIColor?
    var optionType: OptionType
    var isOn: Bool?
    var notificationsIsHidden: Bool?
}

extension Option {
    static var options: [[Option]] = [
        [
            Option(
                image: UIImage(systemName: "airplane") ?? UIImage(),
                name: "Авиарежим",
                iconBackgroundColor: .systemOrange,
                optionType: .switched,
                isOn: true
            ),
            Option(
                image: UIImage(systemName: "wifi") ?? UIImage(),
                name: "Wi-Fi",
                iconBackgroundColor: .systemBlue,
                optionType: .described(state: .notConnected)
            ),
            Option(
                image: UIImage(named: "bluetooth")?.withTintColor(.white) ?? UIImage(),
                name: "Bluetooth",
                iconBackgroundColor: .systemBlue,
                optionType: .described(state: .on)
            ),
            Option(
                image: UIImage(systemName: "antenna.radiowaves.left.and.right")?.withConfiguration(UIImage.SymbolConfiguration(weight: .semibold)) ?? UIImage(),
                name: "Сотовая связь",
                iconBackgroundColor: .systemGreen,
                optionType: .general
            ),
            Option(
                image: UIImage(systemName: "personalhotspot")?.withConfiguration(UIImage.SymbolConfiguration(weight: .bold)) ?? UIImage(),
                name: "Режим модема",
                iconBackgroundColor: .systemGreen,
                optionType: .described(state: .none)
            ),
            Option(
                image: UIImage(named: "vpn")?.withTintColor(.white) ?? UIImage(),
                name: "VPN",
                iconBackgroundColor: .systemBlue,
                optionType: .switched,
                isOn: false
            )
        ],
        [
            Option(
                image: UIImage(systemName: "app.badge") ?? UIImage(),
                name: "Уведомления",
                iconBackgroundColor: .systemRed,
                optionType: .general
            ),
            Option(
                image: UIImage(systemName: "speaker.3.fill") ?? UIImage(),
                name: "Звуки, тактильные сигналы",
                iconBackgroundColor: .systemPink,
                optionType: .general
            ),
            Option(
                image: UIImage(systemName: "moon.fill") ?? UIImage(),
                name: "Не беспокоить",
                iconBackgroundColor: .systemIndigo,
                optionType: .general
            ),
            Option(
                image: UIImage(systemName: "hourglass") ?? UIImage(),
                name: "Экранное время",
                iconBackgroundColor: .systemIndigo,
                optionType: .general
            )
        ],
        [
            Option(
                image: UIImage(systemName: "gear")?.withConfiguration(UIImage.SymbolConfiguration(weight: .medium)) ?? UIImage(),
                name: "Основные",
                iconBackgroundColor: .systemGray2,
                optionType: .general,
                notificationsIsHidden: false
            ),
            Option(
                image: UIImage(systemName: "switch.2") ?? UIImage(),
                name: "Пункт управления",
                iconBackgroundColor: .systemGray2,
                optionType: .general
            ),
            Option(
                image: UIImage(systemName: "textformat.size")?.withConfiguration(UIImage.SymbolConfiguration(weight: .medium)) ?? UIImage(),
                name: "Экран и яркость",
                iconBackgroundColor: .systemBlue,
                optionType: .general
            ),
            Option(
                image: UIImage(systemName: "dock.rectangle") ?? UIImage(),
                name: "Экран «‎Домой»‎",
                iconBackgroundColor: .systemBlue,
                optionType: .general
            ),
            Option(
                image: UIImage(named: "accessibility")?.withTintColor(.white) ?? UIImage(),
                name: "Универсальный доступ",
                iconBackgroundColor: .systemBlue,
                optionType: .general
            ),
            Option(
                image: UIImage(named: "wallpaper")?.withTintColor(.white) ?? UIImage(),
                name: "Обои",
                iconBackgroundColor: .systemCyan,
                optionType: .general
            ),
            Option(
                image: UIImage(named: "siri") ?? UIImage(),
                name: "Siri и Поиск",
                iconBackgroundColor: UIColor(red: 0.00, green: 0.12, blue: 0.20, alpha: 1.00),
                optionType: .general
            ),
            Option(
                image: UIImage(systemName: "faceid") ?? UIImage(),
                name: "Face ID и код-пароль",
                iconBackgroundColor: .systemGreen,
                optionType: .general
            ),
            Option(
                image: UIImage(systemName: "sos") ?? UIImage(),
                name: "Экстренный вызов — SOS",
                iconBackgroundColor: .systemRed,
                optionType: .general
            ),
            Option(
                image: UIImage(named: "virus")?.withTintColor(.red) ?? UIImage(),
                name: "Уведомление о контакте",
                iconBackgroundColor: .systemGray5,
                optionType: .general
            ),
            Option(
                image: UIImage(systemName: "battery.100") ?? UIImage(),
                name: "Аккумулятор",
                iconBackgroundColor: .systemGreen,
                optionType: .general
            ),
            Option(
                image: UIImage(systemName: "hand.raised.fill") ?? UIImage(),
                name: "Конфиденциальность и безопасность",
                iconBackgroundColor: .systemBlue,
                optionType: .general)
        ]
    ]
}
