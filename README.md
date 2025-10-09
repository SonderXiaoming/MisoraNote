# 美空笔记 (MisoraNote)

<div align="center">
  <img src="./resources/img/app_icon.png" alt="美空笔记" width="128" height="128">
  
  <p><strong>公主连结速查助手</strong></p>
  <p>一个专为《公主连结Re:Dive》玩家打造的游戏资料速查工具</p>

[![Flutter](https://img.shields.io/badge/Flutter-3.35.4-02569B?logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux%20%7C%20Android%20%7C%20iOS-lightgrey)]()

</div>

---

## ✨ 特性

- 🚀 **跨平台支持** - 支持 Windows、macOS、Linux、Android、iOS 多平台 （构建又报错了，等修）
- 🎨 **Material Design 3** - 现代化的 UI 设计，流畅的用户体验
- 🌈 **主题定制** - 支持多种颜色主题和明暗模式
- 💾 **数据缓存** - 智能缓存机制，提升加载速度
- 🔍 **快速搜索** - 强大的搜索功能，快速定位所需资料

## 📦 下载

前往 [Releases](https://github.com/SonderXiaoming/MisoraNote/releases) 页面下载最新版本：

- **Windows**: `misora_note_vX.X.X_windows_x64.zip` - 解压后运行 `misora_note.exe`
- **macOS**: `misora_note_vX.X.X_macos.dmg` - 双击安装
- **Android**:
  - ARM64: `misora_note_vX.X.X_arm64-v8a.apk` (推荐，适用于大多数现代设备)
  - ARMv7: `misora_note_vX.X.X_armeabi-v7a.apk` (适用于较老的设备)
- **iOS**: `misora_note_vX.X.X_ios_unsigned.ipa` (需自行签名安装)
- **Linux**: `misora_note_vX.X.X_linux_x64.tar.gz` - 解压后运行 `misora_note`

## 🚀 快速开始

### 安装

1. 从 [Releases](https://github.com/SonderXiaoming/MisoraNote/releases) 下载适合您系统的版本
2. 根据您的平台进行安装：
   - **Windows**: 解压 ZIP 文件，双击 `misora_note.exe`
   - **macOS**: 打开 DMG 文件，将应用拖入 Applications 文件夹
   - **Linux**: 解压 tar.gz 文件，在终端中运行 `./misora_note`
   - **Android**: 安装 APK 文件（可能需要允许"未知来源"）
   - **iOS**: 使用 Sideloadly 等工具签名并安装

### 使用方法

1. **首次启动**

   - 应用会自动初始化数据库
   - 首次加载可能需要几秒钟下载数据库

2. **查询资料**

   - 在主界面浏览游戏资料
   - 使用搜索功能快速定位角色/装备/Boss 信息
   - 点击条目查看详细信息

3. **自定义设置**

   - 点击设置图标进入设置页面
   - 可调整主题颜色、语言等选项
   - 根据需求配置数据更新方式

4. **数据更新**
   - 应用会定期检查数据更新
   - 可在设置中手动刷新数据

## 🛠️ 开发

### 环境要求

- Flutter SDK >= 3.8.0
- Dart SDK >= 3.9.0
- 对应平台的开发工具（详见 [Flutter 官方文档](https://docs.flutter.dev/get-started/install)）

### 本地构建

```bash
# 克隆仓库
git clone https://github.com/SonderXiaoming/MisoraNote.git
cd MisoraNote

# 安装依赖
flutter pub get

# 运行应用（开发模式）
flutter run

# 构建发布版本
# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release

# Android
flutter build apk --release --split-per-abi

# iOS
flutter build ios --release
```

### 项目结构

```
lib/
├── main.dart              # 应用入口
├── app.dart               # 应用配置
├── constants.dart         # 常量定义
├── core/                  # 核心功能
│   ├── database/         # 数据库相关
│   ├── network/          # 网络请求
│   └── utils/            # 工具类
├── features/             # 功能模块
│   ├── component/        # 通用组件
│   ├── home/            # 主页
│   ├── detail/          # 详情页
│   └── settings/        # 设置页
└── l10n/                # 国际化
resources/
├── db/                   # 数据库文件
└── img/                  # 图片资源
```

## 📋 TODO List

### 核心功能

- [ ] 角色/敌人具体数值
- [ ] 专武信息展示
- [ ] 公会战等一些常用场景怪物速查 UI
- [ ] 活动日程

基本上优先搬运环奈笔记的功能

### 数据管理

- [ ] 自动更新检测
- [ ] 数据导入/导出功能
- [ ] 离线数据包下载

### 用户体验

- [ ] 收藏功能
- [ ] 搜索历史
- [ ] 夜间模式优化
- [ ] 动画效果优化
- [ ] 更多主题配色

### 其他

- [ ] 意见反馈入口
- [ ] 关于页面完善
- [ ] 多语言支持（日语、英语）

## 🎯 数据来源

本项目使用以下数据源：

- **游戏数据库**: [wthee.xyz](https://wthee.xyz) - 提供公主连结游戏数据 API
- **资源文件**: [redive.estertion.win](https://redive.estertion.win) - 游戏图片资源
- **数据格式**: 支持 CN（国服）、TW（台服）、JP（日服）多服务器数据

感谢 [@wthee](https://github.com/wthee) 提供的数据 API 支持！

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

### 贡献指南

1. Fork 本仓库
2. 创建您的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

## 📝 更新日志

查看 [Releases](https://github.com/SonderXiaoming/MisoraNote/releases) 页面了解版本更新历史。

## 📄 许可证

本项目采用 MIT License 许可证。详见 [LICENSE](LICENSE) 文件。

## 🙏 致谢

- [Flutter](https://flutter.dev) - 跨平台 UI 框架
- [公主连结 Re:Dive](https://game.bilibili.com/pcr/) - 游戏官方
- [pcr-tool](https://github.com/wthee/pcr-tool) - 项目参考与灵感来源
- [环奈笔记 (kanna_note)](https://github.com/SonderXiaoming/kanna_note) - bot 端版本项目，受限制于平台，基本完工
- [wthee.xyz](https://wthee.xyz) - 数据 API 支持
- 所有为本项目做出贡献的开发者

## 📮 联系方式

- **联系 QQ**: 1316864423
- **环奈 bot 交流群**: 105733883
- **作者**: [@SonderXiaoming](https://github.com/SonderXiaoming)

## ⚠️ 免责声明

本应用仅供学习交流使用，不用于任何商业目的。所有游戏相关资料版权归《公主连结 Re:Dive》官方所有。

---

<div align="center">
  <p>如果这个项目对您有帮助，请给个 ⭐ Star 支持一下！</p>
  <p>Made with ❤️ by <a href="https://github.com/SonderXiaoming">SonderXiaoming</a></p>
</div>
