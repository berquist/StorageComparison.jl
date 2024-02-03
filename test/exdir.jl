using PythonCall
using Test

@testset "Exdir" begin
    @testset "roundtrip_jl_py_jl" begin
        exdir = pyimport("exdir")
    end
end
