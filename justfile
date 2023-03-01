shell:
    nix develop

build:
    purifix compile

build-ide:
    purifix compile --json-errors 'pkgs/sample-server/src/**/*.purs'