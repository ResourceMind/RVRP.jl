function instance_check_unit_tests()

    check_if_supports_tests()
    check_positive_range_tests()
    check_time_windows_tests()
    check_repeated_ids_tests()

end

function check_repeated_ids_tests()
    data = RVRP.RvrpInstance()
    data.locations = [RVRP.Location(;id = "repeated_id"),
                      RVRP.Location(;id = "repeated_id")]
    @test_throws ErrorException RVRP.check_repeated_ids(data)
end

function check_if_supports_tests()

    supported_vec = [BitSet([1, 4, 10, 20, 30, 100]), BitSet([1, 2, 3, 4, 10, 20, 30, 100])]
    features = BitSet([1, 2, 10, 20])
    @test RVRP.check_if_supports(supported_vec, features) == true

    features = BitSet([1, 2, 23])
    @test RVRP.check_if_supports(supported_vec, features) == false

end

function check_positive_range_tests()
    range = RVRP.Range()
    @test RVRP.check_positive_range(range, "") == nothing

    range = RVRP.Range(-1.0, 10.0)
    @test_throws ErrorException RVRP.check_positive_range(range, "")

    range = RVRP.Range(1.0, -10.0)
    @test_throws ErrorException RVRP.check_positive_range(range, "")

    range = RVRP.Range(100.0, 10.0)
    @test_throws ErrorException RVRP.check_positive_range(range, "")
end

function check_time_windows_tests()

    tws = [RVRP.Range(10.0, 20.0), RVRP.Range(15.0, 20)]
    @test_throws ErrorException RVRP.check_time_windows(tws, "")

    tws = [RVRP.Range(10.0, 20.0), RVRP.Range(0.0, 5.0)]
    @test_throws ErrorException RVRP.check_time_windows(tws, "")

end
