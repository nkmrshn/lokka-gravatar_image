Lokka Gravatar Image
====================

This is a [Lokka](http://lokka.org) plugin for [Gravatar Image requests](http://www.gravatar.com/site/implement/images/).

Installation
------------

Run these commands:

    $ cd public/plugin
    $ git clone git://github.com/nkmrshn/lokka-gravatar_image.git

Usage
-----

The URL for src property in the img element is like:

    <img src="/gravatar_image/<%= post.user.id %>"/>
    <img src="/gravatar_image/<%= @entry.user.id %>/16"/>

The first URL, in the src property is passing user's ID. The second one is passing user's ID and the image size(in this case it is 16px). If you didn't specify the size of image, like the first URL, it will be 80px.

You can specify other options, like rating, in the Admin->[Plugins]->[Gravatar Image].
