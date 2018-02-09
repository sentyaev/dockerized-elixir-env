# Dockerized Elixir Development Environment

### How to start
Clone this repo whith name you'd like.
```
git clone git@github.com:sentyaev/dockerized-elixir-env.git <your-app-name>
```

Run `build.sh`
It will create `src` folder with the Elixir application with the name of folder name.

### Working with application
There is two helpers `./mix` and `./run`.

Whith `./run` you can run `iex` or `mix` commands.

For instance: `./run iex -S mix`

`./mix` is just to work with `mix`.

So instead of `./run mix compile` it's possible to execute `/mix compile`.

### Example:
```
git clone git@github.com:sentyaev/dockerized-elixir-env.git my-app
cd my-app
./build.sh
```
After this `my-app` folder will look like this:
```
.
├── Dockerfile
├── build.sh
├── docker-compose.yml
├── docker-compose.yml.tmpl
├── mix
├── run
└── src
    ├── README.md
    ├── config
    │   └── config.exs
    ├── lib
    │   └── drunk_rabbit.ex
    ├── mix.exs
    └── test
        ├── drunk_rabbit_test.exs
        └── test_helper.exs
```
And `mix.exs`:
```
defmodule MyApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_app,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
```