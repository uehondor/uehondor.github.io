---
layout: post
published: true
title: Setup autoload for your application using composer
date: '2013-03-26 09:16:06 +0000'
---
Composer is a great tool for managing your application's dependencies on third-party libraries.
Apart from downloading and installing libraries, composer also takes care of making the classes, interfaces etc. available application-wide. This is called auto-loading.

Ok, that's a rather short intro. See more about composer at [http://getcomposer.org/doc](http://getcomposer.org/doc).

Now to the reason for this blog post.

Composer can also help abstract your auto-loading needs. You can tell composer where to auto-load your classes and interfaces from, and also give some specific info. on how to auto-load them.

(Assuming you've read a little but about composer from the link above and you know about the composer.json file), you simply configure the composer's autoloader for your application by adding the following to your composer.json file.

```
{
    "autoload": {
        "psr-0": {
            "MyAppNamespace": "src/",
            "MyOtherAppNamespace\\SubNameSpace\\": "anotherSrc/"
        }
    }
}
```

Oh! and by the way, [psr-0](http://github.com/php-fig/fig-standards/blob/master/accepted/PSR-0.md) is the PHP autoload coding standard and is supported by composer.

For more information about the composer's autoloader, see [http://getcomposer.org/doc/04-schema.md#autoload](http://getcomposer.org/doc/04-schema.md#autoload).
