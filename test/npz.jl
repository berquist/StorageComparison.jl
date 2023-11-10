using NPZ
using PythonCall
using Test

@testset "NPZ" begin
    @testset "roundtrip_jl_py_jl" begin
        shape = (2, 3, 1, 2)
        a = 0
        b = 10
        x_ref = (b - a) .* rand(Float64, shape) .+ a
        y_ref = rand(a:b, shape)
        b_path = "b_rt_jl.npy"
        x_path = "x_rt_jl.npy"
        y_path = "y_rt_jl.npy"
        npzwrite(b_path, b)
        npzwrite(x_path, x_ref)
        npzwrite(y_path, y_ref)

        np = pyimport("numpy")

        b_py = pyconvert(Array, np.load(b_path))
        @test size(b_py) == ()
        @test b_py[] == b

        x_py = pyconvert(Array, np.load(x_path))
        @test size(x_py) == shape
        @test x_py == x_ref

        y_py = pyconvert(Array, np.load(y_path))
        @test size(y_py) == shape
        @test y_py == y_ref

        b_path2 = "b_rt_jl_py.npy"
        x_path2 = "x_rt_jl_py.npy"
        y_path2 = "y_rt_jl_py.npy"

        np.save(b_path2, np.load(b_path))
        np.save(x_path2, np.load(x_path))
        np.save(y_path2, np.load(y_path))

        b_jl = npzread(b_path2)
        @test b_jl == b

        x_jl = npzread(x_path2)
        @test x_jl == x_ref

        y_jl = npzread(y_path2)
        @test y_jl == y_ref
    end
end
