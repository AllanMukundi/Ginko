# Ginko

Ginko is a Discord bot which can run code written in 36 languages and output the
results within a server.

To add Ginko to your server, follow this link: https://discordapp.com/oauth2/authorize?client_id=433423882347872267&scope=bot

## Usage

```
@Ginko <language>
```[language for syntax highlighting]
<code>
```

## Languages Supported

```txt
Assembly      Idris
ATS           Java
Bash          JavaScript
C             Julia
Clojure       Kotlin
COBOL         Lua
CoffeeScript  Mercury
cpp           Nim
Crystal       OCaml
csharp        Perl
D             Perl6
Elixir        PHP
Elm           Python
Erlang        Ruby
fsharp        Rust
Go            Scala
Groovy        Swift
Haskell       TypeScript
```

## Examples

![](https://user-images.githubusercontent.com/19519445/38785812-8758b4d6-40f1-11e8-8fb2-237bae3aa808.png)

![](https://user-images.githubusercontent.com/19519445/38785810-83c35524-40f1-11e8-9cb3-430838a1e41e.png)

## Running your own instance of Ginko

After cloning this repo, you will need to generate a [Discord application token](https://discordapp.com/developers/applications/me/create) and
a [Glot API token](https://glot.io/api). Set these as environment variables or
manually enter them within `main.rb`.

Following this, run `bundle install` followed by `bundle exec ruby lib/main.rb` in
your terminal from the root of the repo to start Ginko. Note that you will need
to invite Ginko to your server via `https://discordapp.com/oauth2/authorize?client_id=<CLIENT_ID>&scope=bot` where
`<CLIENT_ID>` is your Discord application's ID.

To run tests, enter `bundle exec rake`.
