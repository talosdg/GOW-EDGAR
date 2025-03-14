//
//  MerchandiseViewController.swift
//  GOW
//
//  Created by Edgar Vargas on 13/03/25.
//

import UIKit

struct Device: Hashable{
    let id: UUID = UUID()
    let title: String
    let imageName: String
}
let home = [
    Device(title: "merchandise.item.shirt", imageName: "camisa"),
    Device(title: "merchandise.item.funko", imageName: "funko"),
    Device(title: "merchandise.item.backpack", imageName: "mochila"),
    Device(title: "merchandise.item.poster", imageName: "poster"),
    Device(title: "merchandise.item.hoodie", imageName: "sudadera"),
    Device(title: "merchandise.item.mug", imageName: "taza"),
    Device(title: "merchandise.item.doll", imageName: "theron"),
]


class MerchandiseViewController: UIViewController {
    
    @IBOutlet weak var merchCollectionView: UICollectionView!

    @IBOutlet weak var mTitle: UILabel!
    
    
    lazy var datasource: UICollectionViewDiffableDataSource<Int, Device> = {
        let deviceCell = UICollectionView.CellRegistration<UICollectionViewListCell, Device>{
            cell, indexPath, model in var listContentConfiguration = UIListContentConfiguration.cell()
            listContentConfiguration.text = NSLocalizedString(model.title, comment: "")
            listContentConfiguration.image = UIImage(named: String(model.imageName))
            
            
            // Cambiar el fondo de la celda a negro
                cell.backgroundConfiguration = UIBackgroundConfiguration.clear() // Elimina el fondo predeterminado si es necesario
                cell.contentConfiguration = listContentConfiguration
                
                // Establecer el color de fondo de la celda
                cell.contentView.backgroundColor = .black
            
                listContentConfiguration.textProperties.color = .white
                
                // Aplicar la configuración a la celda
                cell.contentConfiguration = listContentConfiguration

     
        }
        
        let datasource = UICollectionViewDiffableDataSource<Int, Device>(collectionView: merchCollectionView){ collectionView, indexPath, model in
            
            return collectionView.dequeueConfiguredReusableCell(using: deviceCell, for: indexPath, item: model)
        }
        return datasource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Establecer el layout de la UICollectionView para que las celdas ocupen el 50% del ancho
            if let layout = merchCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let itemWidth = merchCollectionView.bounds.width * 1 // 50% del ancho de la colección
                layout.itemSize = CGSize(width: itemWidth, height: 110) // Ajustar la altura a la misma proporción
                layout.minimumInteritemSpacing = 10 // Espaciado entre elementos (ajusta según sea necesario)
                layout.minimumLineSpacing = 10 // Espaciado entre filas (ajusta según sea necesario)
            }
        
        mTitle.setCustomFont(fontName: Constants.fontMenuTitle, size: Constants.fontSizeDefault, textStyle: .title1)
        mTitle.text = NSLocalizedString("menu.option.merchandise", comment: "")

        var snapshot = datasource.snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(home)
        datasource.apply(snapshot)
    }


}
