function utils_unit_tests()
    generate_symmetric_distance_matrix_tests()
    set_indices_tests()
    build_computed_data_tests()
end

function generate_symmetric_distance_matrix_tests()
    xs = [rand(1:20) for i in 1:5]
    ys = [rand(1:20) for i in 1:5]
    matrix = RVRP.generate_symmetric_distance_matrix(xs, ys)
    @test size(matrix) == (5,5)
    for i in 1:5
        @test matrix[i,i] == 0.0
        for j in i+1:5
            @test matrix[i,j] == matrix[j,i]
        end
    end
end

function set_indices_tests()
    data = RVRP.RvrpInstance()
    data.locations = [RVRP.Location(index = rand(-100:-1)) for i in 1:10]
    RVRP.set_indices(data)
    for loc_idx in 1:length(data.locations)
        @test data.locations[loc_idx].index == loc_idx
    end
end

function build_computed_data_tests()
    data = RVRP.RvrpInstance()
    data.locations = [RVRP.Location(
        id = string("loc_", i), index = rand(-100:-1)
    ) for i in 1:9]
    data.vehicle_categories = [RVRP.VehicleCategory(
        id = string("vc_", i)
    ) for i in 1:9]
    RVRP.set_indices(data)
    computed_data = RVRP.build_computed_data(data)
    for (k,v) in computed_data.location_id_2_index
        @test v >= 1
        @test v <= 9
    end
    for (k,v) in computed_data.vehicle_category_id_2_index
        @test v >= 1
        @test v <= 9
    end
end
