module StorageComparison

using ASDF
using Exdir
using JLD2
using HDF5

x1 = rand(2, 3, 4)

f_as = ASDF.open("comp.asdf")
f_ex = exdiropen("comp.exdir", "w")
f_h5 = h5open("comp.h5", "w")
f_jl = jldopen("comp.jld", "w")

NAME_DS1 = "ds1"
NAME_G1 = "g1"

# ASDF

# Exdir

g_ex = create_group(f_ex, NAME_G1)
g_ex[NAME_DS1] = x1

# JLD2

g_jl = JLD2.Group(f_jl, NAME_G1)
g_jl[NAME_DS1] = x1

# HDF5

g_h5 = create_group(f_h5, NAME_G1)
g_h5[NAME_DS1] = x1

end
