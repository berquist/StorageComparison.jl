using StorageComparison
using Documenter

DocMeta.setdocmeta!(StorageComparison, :DocTestSetup, :(using StorageComparison); recursive=true)

makedocs(;
    modules=[StorageComparison],
    authors="Eric Berquist <eric.berquist@gmail.com> and contributors",
    repo="https://github.com/berquist/StorageComparison.jl/blob/{commit}{path}#{line}",
    sitename="StorageComparison.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://berquist.github.io/StorageComparison.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/berquist/StorageComparison.jl",
    devbranch="main",
)
