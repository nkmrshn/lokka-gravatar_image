Lokka Gravatar Image
====================

これは、[Gravatar Image requests](http://ja.gravatar.com/site/implement/images/)の[Lokka](http://lokka.org)プラグインです。

インストール
------------

    $ cd public/plugin
    $ git clone git://github.com/nkmrshn/lokka-gravatar_image.git

使い方
------

img要素のsrc属性にURLを指定します：

    <img src="/gravatar_image/<%= post.user.id %>"/>
    <img src="/gravatar_image/<%= @entry.user.id %>/16"/>

最初のURLは、ユーザIDを指定しています。二番目は、ユーザIDと画像サイズ（この場合では16px）を指定してます。画像サイズを指定しなかった場合、画像サイズは80pxになります。

レーティングなど、その他のオプションは、管理画面->[プラグイン]->[Gravatar Image]で設定できます。
