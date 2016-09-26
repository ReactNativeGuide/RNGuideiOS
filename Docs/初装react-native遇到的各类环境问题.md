##Q&A

####0：node及npm版本问题

建议把node版本安装/升级到4.0以上的版本，npm至少要3.3以上的版本，如果你都安装目前最高的版本，应该是没有问题的；

0. 如何安装呢？
A：可以通过homebrew，下载最新版的node；
```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```
 
1. 我之前装过homebrew，为啥我uninstall卸载了旧版本(如v0.10.1)，重新下载还是这个版本？
A：homebrew有包缓存机制，执行
```
$ brew update # 更新 Homebrew 的信息 
$ brew outdated # 看一下哪些软件可以升级 
$ brew upgrade <xxx> # 如果不是所有的都要升级，那就这样升级指定的 
$ brew cleanup # 如果都要升级，直接升级完然后清理干净
```
或者
```
$ brew cleanup # 清理缓存包
$ brew install node #下载node
```

2. node版本控制？
A：可以通过nvm或者n来管理、更换node版本哦！我用的是n，所以以n为例：
```
$ sudo npm install -g n #安装n
$ n 5.3.0 #指定安装5.3.0的node版本
$ n latest #安装最新版本
$ n stable #安装最新稳定版本
```

3. npm的版本呢？
A：至少v3.3版本，我用的是v3.6.0，据说低版本下载的依赖文件有问题哦~不要以身试险。
```
$ npm -v #查看当前版本
$ sudo npm -g install npm #升级npm，还可以$ sudo npm -g install npm@3.6.0指定版本更新
```

####1：Xcode编译无错,但运行不起来

0. `EmbeddedAppIOS`这个Demo中, 无法打开`http://localhost:8081/componentIndex.ios.bundle?platform=ios`,但实际上浏览器可以打开.
实测使用本地bundle的形式加载又是正常的,开始怀疑是环境问题...这时看到Xcode-Console中的Log如下:
```
2016-02-03 16:41:45.281 [trace][tid:com.facebook.React.JavaScript][RCTJSCProfiler.m:63] JSC profiler is not supported.
2016-02-03 16:41:45.512 IntergratingDemo[54636:5924167] App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.
2016-02-03 16:41:45.517 [error][tid:main] Could not connect to development server.

Ensure the following:
- Node server is running and available on the same network - run 'npm start' from react-native root
- Node server URL is correctly set in AppDelegate

URL: http://localhost:8081/componentIndex.ios.bundle?platform=ios
```
A: 原来是个iOS9的适配问题,详见以前的blog: [App Transport Security Support Aka Apps on iOS 9 Don't Work](http://blog.saick.net/blog/2015/06/25/app-transport-security-support-aka-apps-on-ios-9-dont-work/)
