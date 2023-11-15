//
//  ViewController.swift
//  MyMusic
//
//  Created by Afraz Siddiqui on 4/3/20.
//  Copyright © 2020 ASN GROUP LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

    func configureSongs() {
        songs.append(Song(name: "稻香",
                          albumName: "GarageBand",
                          artistName: "Brandon",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Moonlight in the city",
                          albumName: "Logic Pro X",
                          artistName: "Brandon",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "小情歌",
                          albumName: "GarageBand",
                          artistName: "Brandon",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "好好",
                          albumName: "GarageBand",
                          artistName: "May Day",
                          imageName: "cover4",
                          trackName: "song4"))
        songs.append(Song(name: "Gimmick",
                          albumName: "GarageBand",
                          artistName: "Brandon",
                          imageName: "cover5",
                          trackName: "song5"))
        songs.append(Song(name: "哥抽菸",
                          albumName: "Logic Pro X",
                          artistName: "Namewee",
                          imageName: "cover6",
                          trackName: "song6"))
        songs.append(Song(name: "Peaceful Theme",
                          albumName: "Naruto",
                          artistName: "Brandon",
                          imageName: "cover7",
                          trackName: "song7"))
    }

    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }


}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
