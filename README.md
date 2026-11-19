# 紫金科创 · 园区漫游

Innovation Hub 是一个独立的三维园区展示项目。可以在浏览器里自由查看建筑与景观、切换预设视角，或沿飞行路线自动漫游。

## 本地运行

需要 Python 3 和支持 WebGL 的现代浏览器。将仓库克隆到本地，或从 GitHub 下载 ZIP 后解压，再进入包含 `index.html` 的目录。

在 macOS 上，双击 `启动园区.command` 即可启动并打开预览。首次启动后请保持终端窗口打开。

也可以手动启动预览服务。

```bash
git clone https://github.com/flowers-10/innovation-hub.git
cd innovation-hub
python3 -m http.server 8785 --bind 127.0.0.1
```

通过 ZIP 获取项目时，在解压目录中直接执行最后一条命令。服务器启动后，在浏览器打开 [http://127.0.0.1:8785](http://127.0.0.1:8785/)。如果端口被占用，可以换成 `8786`，并同步修改浏览器地址。通过本地 HTTP 地址访问可让浏览器加载 JavaScript 模块、场景配置和模型资源。

## 漫游操作

- 拖动画面旋转视角，滚动鼠标滚轮缩放。
- 使用「主入口」「园区总览」「沿河鸟瞰」「中央连廊」切换预设视角。
- 点击「开始漫游」沿路线飞行，可随时暂停、继续或结束。按 `Esc` 也可结束当前路线。
- 如果系统启用了减少动态效果，界面会用「下一视角」逐站切换。

## 项目结构

| 路径 | 用途 |
| --- | --- |
| `index.html` | 漫游页面、视角菜单和交互逻辑 |
| `runtime.js` | 已打包的三维渲染运行时 |
| `project.json` | 场景配置，包括模型、光照、相机视角和漫游路线 |
| `assets/models/` | 建筑、场景和植被模型 |
| `assets/hdr/` | HDR 环境贴图 |
| `assets/textures/` | 地表和场景纹理 |

调整预设视角或路线时，可在 `project.json` 的 `editor.config.views` 和 `editor.config.cameraTours` 中找到对应配置。部署到静态托管时，将 `index.html`、`runtime.js`、`project.json` 和完整的 `assets/` 同级上传即可，无需构建步骤。首次加载会读取三维模型和纹理，耗时取决于设备性能与网络速度。
