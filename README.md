# SwiftSlug

SwiftSlug is a simple package to convert strings to URL slugs. A "slug" is the address of a page on your website, which for SEO reasons is often created using the title of your page. SwiftSlug is responsible for converting a string such as "Hello, world!" into "hello-world" so it's safe to use in a URL.

SwiftSlug works on both macOS and Linux, although it operates quite differently on both platforms due to API limitations. On macOS 10.11 or later, SwiftSlug uses an ICU transform so that all UTF-8 characters are correctly transliterated into Latin letters, but on Linux this approach is not available so it does a lossy ASCII conversion instead.

**If you can think of any way to improve cross-platform transliteration, pull requests are most welcome!**


## Usage

SwiftSlug adds a `convertedToSlug()` method on Swift's `String` type, which returns `String?`: a string if the conversion was successful or `nil` otherwise. For example, this will print "hello-world":

```swift
if let slug = try? "Hello, world".convertedToSlug() {
    print(slug)
}
```

The method will throw `SlugConversionError.failedToConvert` if transliteration could not take place for some reason, or if the resulting slug had zero characters.

**Note:** Although macOS 10.10 is supported, it's preferable to set a deployment target of 10.11 (El Capitan) or later to get the best results.


## Examples

```swift
if let slug1 = try? "Hello, world".convertedToSlug() {
    print(slug1)
} else {
    print("slug1 could not be converted.")
}

if let slug2 = try? "!@$%^Hello, world!:|~?><".convertedToSlug() {
    print(slug2)
} else {
    print("slug2 could not be converted.")
}

if let slug3 = try? "吃葡萄不吐葡萄皮".convertedToSlug() {
    print(slug3)
} else {
    print("slug3 could not be converted.")
}
```


Output on macOS:

> hello-world

> hello-world

> chi-pu-tao-bu-tu-pu-tao-pi

Output on Linux:

> hello-world

> hello-world

> slug3 could not be converted.

Linux fails to convert `slug3` because it contains no characters that can be reduced to ASCII even with lossy conversion.


## License

This package is released under the MIT License, which is copied below.

Copyright (c) 2016 Paul Hudson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
