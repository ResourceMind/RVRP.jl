include("../src/RichVehicleRoutingProblem.jl")
const RVRP = RichVehicleRoutingProblem

using Test

include("unit_tests/unit_tests.jl")

unit_tests()
