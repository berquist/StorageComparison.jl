using StorageComparison
using Test
using Aqua

@testset "StorageComparison.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(StorageComparison)
    end
    # Write your tests here.
end
