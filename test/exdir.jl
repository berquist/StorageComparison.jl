using Exdir
using PythonCall
using Test

@testset "Exdir" begin
    # 0. Generate data with Julia
    # 1. Write via Julia
    # 2. Read via Python, compare with 0
    # 3. Write via Python
    # 4. Read via Julia, compare
    @testset "roundtrip_jl_py_jl" begin
        shape = (2, 3, 1, 2)
        a = 0
        b = 10
        x_ref = (b - a) .* rand(Float64, shape) .+ a
        y_ref = rand(a:b, shape)

        b_path = "b_rt_jl.exdir"
        x_path = "x_rt_jl.exdir"
        y_path = "y_rt_jl.exdir"

        dset_name = "data"
        b_jl = exdiropen(b_path, "w")
        x_jl = exdiropen(x_path, "w")
        y_jl = exdiropen(y_path, "w")
        b_dset_jl = create_dataset(b_jl, dset_name, data=b)
        x_dset_jl = create_dataset(x_jl, dset_name, data=x_ref)
        y_dset_jl = create_dataset(y_jl, dset_name, data=y_ref)

        exdir = pyimport("exdir")

        b_file_py = exdir.File(b_path, "r")
        b_dset_py = b_file_py[dset_name]
        b_py = pyconvert(Array, b_dset_py.data)
        @test b_py[] == b

        x_file_py = exdir.File(x_path, "r")
        x_dset_py = x_file_py[dset_name]
        x_py = pyconvert(Array, x_dset_py.data)
        @test size(x_py) == shape
        @test x_py == x_ref

        y_file_py = exdir.File(y_path, "r")
        y_dset_py = y_file_py[dset_name]
        y_py = pyconvert(Array, y_dset_py.data)
        @test size(y_py) == shape
        @test y_py == y_ref
    end
end
