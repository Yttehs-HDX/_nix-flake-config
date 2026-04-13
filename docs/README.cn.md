# Nix Flake Config

> [!CAUTION]
> **该项目已弃用，已迁移至 [https://github.com/Yttehs-HDX/nix-flake-config](https://github.com/Yttehs-HDX/nix-flake-config)**
>
> 请更新您的引用，并使用新仓库以获取最新的更新和改进。

[![zread](https://img.shields.io/badge/Ask_Zread-_.svg?style=flat&color=00b0aa&labelColor=000000&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTQuOTYxNTYgMS42MDAxSDIuMjQxNTZDMS44ODgxIDEuNjAwMSAxLjYwMTU2IDEuODg2NjQgMS42MDE1NiAyLjI0MDFWNC45NjAxQzEuNjAxNTYgNS4zMTM1NiAxLjg4ODEgNS42MDAxIDIuMjQxNTYgNS42MDAxSDQuOTYxNTZDNS4zMTUwMiA1LjYwMDEgNS42MDE1NiA1LjMxMzU2IDUuNjAxNTYgNC45NjAxVjIuMjQwMUM1LjYwMTU2IDEuODg2NjQgNS4zMTUwMiAxLjYwMDEgNC45NjE1NiAxLjYwMDFaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00Ljk2MTU2IDEwLjM5OTlIMi4yNDE1NkMxLjg4ODEgMTAuMzk5OSAxLjYwMTU2IDEwLjY4NjQgMS42MDE1NiAxMS4wMzk5VjEzLjc1OTlDMS42MDE1NiAxNC4xMTM0IDEuODg4MSAxNC4zOTk5IDIuMjQxNTYgMTQuMzk5OUg0Ljk2MTU2QzUuMzE1MDIgMTQuMzk5OSA1LjYwMTU2IDE0LjExMzQgNS42MDE1NiAxMy43NTk5VjExLjAzOTlDNS42MDE1NiAxMC42ODY0IDUuMzE1MDIgMTAuMzk5OSA0Ljk2MTU2IDEwLjM5OTlaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik0xMy43NTg0IDEuNjAwMUgxMS4wMzg0QzEwLjY4NSAxLjYwMDEgMTAuMzk4NCAxLjg4NjY0IDEwLjM5ODQgMi4yNDAxVjQuOTYwMUMxMC4zOTg0IDUuMzEzNTYgMTAuNjg1IDUuNjAwMSAxMS4wMzg0IDUuNjAwMUgxMy43NTg0QzE0LjExMTkgNS42MDAxIDE0LjM5ODQgNS4zMTM1NiAxNC4zOTg0IDQuOTYwMVYyLjI0MDFDMTQuMzk4NCAxLjg4NjY0IDE0LjExMTkgMS42MDAxIDEzLjc1ODQgMS42MDAxWiIgZmlsbD0iI2ZmZiIvPgo8cGF0aCBkPSJNNCAxMkwxMiA0TDQgMTJaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00IDEyTDEyIDQiIHN0cm9rZT0iI2ZmZiIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K&logoColor=ffffff)](https://zread.ai/Yttehs-HDX/Nix-flake-config)

|[English](../README.md)|简体中文|

一个模块化、可复现的 Nix Flake，用于管理多主机、多用户配置，并集成 Home Manager。

## 文档入口
- 索引：[`index.cn.md`](./index.cn.md)

## 快速开始
应用指定主机的系统配置：

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

> [!WARNING]
> 这是我的个人配置，可能仍有 **BUG**。
>
> 不建议直接套用，建议仅作参考并按需调整。

## 关键特性
- **Profile 驱动**：以 profile 定义用户与主机，隔离环境与设置。
- **环境隔离**：不同主机与用户互不干扰，减少冲突。
- **模块化组合**：按需组合 system / home / desktop 构建目标环境。
- **逻辑复用**：通用逻辑集中在 `_lib/`，降低重复配置。
- **声明式配置**：所有状态以 Nix 声明，保证可复现与可版本化。

## 仓库结构
- [`flake.nix`](../flake.nix) – 顶层 flake，聚合 Nixpkgs、Home Manager、NUR、NixVim 等输入。
- [`hosts/`](../hosts/) – 主机配置与硬件信息（如 [`Shetty-Laptop/`](../hosts/Shetty-Laptop/)）。
- [`system/`](../system/) – NixOS 系统级模块，包含全局配置、系统软件与 home-aux。
- [`home/`](../home/) – Home Manager 用户层模块，包含全局配置与软件包。
- [`users/`](../users/) – 用户 profile 定义（如 [`shetty/`](../users/shetty/)）。
- [`desktop/`](../desktop/) – 桌面层配置，包含：
  - [`aux/`](../desktop/aux/) – 桌面辅助组件（waybar、rofi、swaync 等）
  - [`dm/`](../desktop/dm/) – Display Manager（sddm）
  - [`sessions/`](../desktop/sessions/) – 会话/窗口管理器（hyprland）
  - [`styles/`](../desktop/styles/) – 主题与字体

## Flake Inputs

| Input | 描述 |
|-------|------|
| [nixpkgs](https://github.com/nixos/nixpkgs) | NixOS 25.11 软件包 |
| [home-manager](https://github.com/nix-community/home-manager) | 用户环境管理 |
| [nur](https://github.com/nix-community/NUR) | Nix User Repository |
| [nixvim](https://github.com/nix-community/nixvim) | Neovim 的 Nix 配置 |
| [hexecute](https://github.com/ThatOtherAndrew/Hexecute) | 自定义工具 |
| [openclaw](https://github.com/openclaw/nix-openclaw) | OpenClaw |

## 致谢
部分配置参考自 [Sly-Harvey/NixOS](https://github.com/Sly-Harvey/NixOS)。

## 许可证
本项目采用 [MIT License](../LICENSE)。
