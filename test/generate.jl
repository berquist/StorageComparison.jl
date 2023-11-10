using NPZ

shape = (2, 3, 1, 2)

a = 0
b = 10

npzwrite("b_jl.npy", b)

x_path = "x_jl.npy"
if !isfile(x_path)
    x = (b - a) .* rand(Float64, shape) .+ a
    npzwrite(x_path, x)
end

y_path = "y_jl.npy"
if !isfile(y_path)
    y = rand(a:b, shape)
    npzwrite(y_path, y)
end
