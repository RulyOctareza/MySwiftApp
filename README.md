<p align="center">
  <img src="docs/preview/hero.svg" alt="MySwiftApp — ilustrasi aplikasi katalog restoran iOS" width="100%">
</p>

<h1 align="center">MySwiftApp — RestaurantApp</h1>

<p align="center">
  <b>Aplikasi katalog restoran native iOS.</b><br>
  Swift · UIKit · XcodeGen
</p>

<p align="center">
  <img alt="Swift" src="https://img.shields.io/badge/Swift-5-F05138?logo=swift&logoColor=white">
  <img alt="iOS" src="https://img.shields.io/badge/iOS-14%2B-000000?logo=apple&logoColor=white">
  <img alt="Xcode" src="https://img.shields.io/badge/Xcode-XcodeGen-147EFB?logo=xcode&logoColor=white">
</p>

---

## ✨ Preview

<p align="center">
  <img src="docs/preview/hero.png" alt="Mockup gelap RestaurantApp" width="90%">
</p>

<table align="center">
  <tr>
    <td><img src="image%20wireframe/home_screen/screen.png" alt="Home" width="200"></td>
    <td><img src="image%20wireframe/item_detail_screen/screen.png" alt="Detail item" width="200"></td>
    <td><img src="image%20wireframe/user_profile_screen/screen.png" alt="Profil" width="200"></td>
  </tr>
  <tr>
    <td align="center">Home</td>
    <td align="center">Detail</td>
    <td align="center">Profil</td>
  </tr>
</table>

---

## 📖 Tentang

RestaurantApp menampilkan daftar item restoran (minimal 10 item) lengkap dengan gambar dan
judul. Ketuk satu item untuk membuka detail berisi deskripsi dan gambar tambahan, atau buka
halaman About untuk melihat identitas pembuat aplikasi.

---

## 🌟 Fitur

- 🍽️ **Home** — daftar item dengan gambar dan judul
- 🔍 **Detail** — deskripsi dan gambar tambahan
- 👤 **About** — identitas pembuat
- 🧩 Model `Item` dan cell kustom (`ItemCell`)

---

## 🧱 Struktur

```text
RestaurantApp/
├── RestaurantApp/
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   ├── ViewController.swift
│   ├── DetailViewController.swift
│   ├── AboutViewController.swift
│   ├── Models/Item.swift
│   ├── Views/ItemCell.swift
│   └── Assets.xcassets
├── RestaurantApp.xcodeproj
├── project.yml          # XcodeGen spec
└── Info.plist
```

---

## 🚀 Menjalankan

1. Buka `RestaurantApp.xcodeproj` di Xcode.
2. Pilih simulator atau perangkat fisik.
3. Build & run.

Atau regenerate project dengan XcodeGen:

```bash
xcodegen generate
```

**Kebutuhan:** Xcode 12+, iOS 14+.

---

## 📄 Lisensi

MIT © Fatchurizkia Ruly Octareza
