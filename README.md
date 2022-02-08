# Random Anime Quotes

An random anime quote app I made for fun.

<center><strong>Powered by <a href="https://airi.kyoyo.me" target="_blank">Airi</a></strong></center>

## Preview

https://user-images.githubusercontent.com/67658540/149021618-7259a4d6-592a-456c-abb9-fe8e681b994f.mp4

## Features

✅ Like and save locally your favorite quotes.

✅ Dark and light themes with multiple primary colors.

✅ Share and copy to clipboard.

✅ Translate to any of the supported languages.

✅ Offline Mode

## Getting Started

**Step 1:**

Clone this repo


```
git clone https://github.com/rcjuancarlosuwu/random_anime_quotes.git
```
**Step 2:**

Get pub packages


```
flutter pub get
```

**Step 3:**

Get your API KEY. _[Click here](https://docs.animu.ml/#frequently-asked-questions-faqs)_

**Step 4:**

Add your API KEY here: lib\src\core\env\env_config.dart

```dart
class EnvConfig {
    EnvConfig._();

    static const apiToken = 'your-api-key-here';
    
    static const apiUrl = 'https://animu.ml/api/';
}
```

**Step 5:**

Build the app

- **iOS:** `flutter build ipa`
  
- **Android:** `flutter build apk`

## License

MIT License

Copyright (c) 2022 Juan Carlos Ramón Condezo

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
