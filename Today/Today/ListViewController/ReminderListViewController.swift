//
//  ViewController.swift
//  Today
//
//  Created by Ayrmidon Hagraven on 5/16/24.
//

import UIKit


// Класс ReminderListViewController наследуется от UICollectionViewController,
// что позволяет использовать коллекцию для отображения данных и управления пользовательским интерфейсом
class ReminderListViewController: UICollectionViewController {
    
    //Свойство dataSource используется для управления данными в коллекции
    var dataSource: DataSource!
    // reminders содержит массив объектов Reminder, которые будут отображаться в коллекции.
    var reminders: [Reminder] = Reminder.sampleData
    
    // Метод viewDidLoad() вызывается при загрузке экрана и используется для инициализации
    // элементов и настройки пользовательского интерфейса.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Объект listLayout() инициализирует и настраивает композиционный макет для отображения элементов в коллекции.
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        //cellRegistration используется для регистрации и настройки ячеек коллекции.
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        // замыкание в инициализации определяет способ конфигурации ячейки.
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        // обновляем интерфейс 
        updateSnapshot()
        
        //collectionView.dataSource присваивается dataSource для определения источника данных коллекции
        collectionView.dataSource = dataSource
    }

    // Приватный метод listLayout() используется для создания и настройки композиционного макета коллекции
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

