import Base: ==
 
function ==(r1::RVRP.Range, r2::RVRP.Range)
    return (
    r1.hard_min == r2.hard_min
    && r1.soft_min == r2.soft_min
    && r1.soft_max == r2.soft_max
    && r1.hard_max == r2.hard_max
    && r1.flat_unit_price == r2.flat_unit_price
    && r1.shortage_extra_unit_price == r2.shortage_extra_unit_price
    && r1.excess_extra_unit_price == r2.excess_extra_unit_price
    )
end

function ==(l1::RVRP.Location, l2::RVRP.Location)
    return (
        l1.id == l2.id
        && l1.index == l2.index
        && l1.x_coord == l2.x_coord
        && l1.y_coord == l2.y_coord
        && l1.opening_time_windows == l2.opening_time_windows
        && l1.access_time == l2.access_time
        && l1.energy_fixed_cost == l2.energy_fixed_cost
        && l1.energy_unit_cost == l2.energy_unit_cost
        && l1.energy_recharging_speeds == l2.energy_recharging_speeds
    )
end

function ==(lg1::RVRP.LocationGroup, lg2::RVRP.LocationGroup)
    return (
        lg1.id == lg2.id
        && lg1.location_ids == lg2.location_ids
    )
end

function ==(pc1::RVRP.ProductCategory, pc2::RVRP.ProductCategory)
    return (
        pc1.id == pc2.id
        && pc1.conflicting_product_ids == pc2.conflicting_product_ids
        && pc1.prohibited_predecessor_product_ids == pc2.prohibited_predecessor_product_ids
    )
end

function ==(sp1::RVRP.SpecificProduct, sp2::RVRP.SpecificProduct)
    return (
        sp1.id == sp2.id
        && sp1.product_category_id == sp2.product_category_id
        && sp1.pickup_availabitilies_at_location_ids == sp2.pickup_availabitilies_at_location_ids
        && sp1.delivery_capacities_at_location_ids == sp2.delivery_capacities_at_location_ids
    )
end

function ==(req1::RVRP.Request, req2::RVRP.Request)
    return (
        req1.id == req2.id
        && req1.specific_product_id == req2.specific_product_id
        && req1.split_fulfillment == req2.split_fulfillment
        && req1.precedence_status == req2.precedence_status
        && req1.semi_mantadory == req2.semi_mantadory
        && req1.product_quantity_range == req2.product_quantity_range
        && req1.shipment_capacity_consumption == req2.shipment_capacity_consumption
        && req1.shipment_property_requirements == req2.shipment_property_requirements
        && req1.pickup_location_group_id == req2.pickup_location_group_id
        && req1.pickup_location_id == req2.pickup_location_id
        && req1.delivery_location_group_id == req2.delivery_location_group_id
        && req1.delivery_location_id == req2.delivery_location_id
        && req1.pickup_service_time == req2.pickup_service_time
        && req1.delivery_service_time == req2.delivery_service_time
        && req1.max_duration == req2.max_duration
        && req1.duration_unit_cost == req2.duration_unit_cost
        && req1.pickup_time_windows == req2.pickup_time_windows
        && req1.delivery_time_windows == req2.delivery_time_windows
    )
end

function ==(vc1::RVRP.VehicleCategory, vc2::RVRP.VehicleCategory)
    return (
        vc1.id == vc2.id
        && vc1.compartment_capacities == vc2.compartment_capacities
        && vc1.vehicle_properties == vc2.vehicle_properties
        && vc1.compartments_properties == vc2.compartments_properties
        && vc1.energy_interval_lengths == vc2.energy_interval_lengths
        && vc1.loading_option == vc2.loading_option
    )
end

function ==(hvs1::RVRP.HomogeneousVehicleSet, hvs2::RVRP.HomogeneousVehicleSet)
    return (
        hvs1.id == hvs2.id
        && hvs1.vehicle_category_id == hvs2.vehicle_category_id
        && hvs1.departure_location_group_id == hvs2.departure_location_group_id
        && hvs1.departure_location_id == hvs2.departure_location_id
        && hvs1.arrival_location_group_id == hvs2.arrival_location_group_id
        && hvs1.arrival_location_id == hvs2.arrival_location_id
        && hvs1.working_time_window == hvs2.working_time_window
        && hvs1.travel_distance_unit_cost == hvs2.travel_distance_unit_cost
        && hvs1.travel_time_unit_cost == hvs2.travel_time_unit_cost
        && hvs1.service_time_unit_cost == hvs2.service_time_unit_cost
        && hvs1.waiting_time_unit_cost == hvs2.waiting_time_unit_cost
        && hvs1.initial_energy_charge == hvs2.initial_energy_charge
        && hvs1.nb_of_vehicles_range == hvs2.nb_of_vehicles_range
        && hvs1.max_working_time == hvs2.max_working_time
        && hvs1.max_travel_distance == hvs2.max_travel_distance
        && hvs1.allow_ongoing == hvs2.allow_ongoing
    )
end

function ==(data1::RVRP.RvrpInstance, data2::RVRP.RvrpInstance)
    return (
        data1.id == data2.id
        && data1.travel_distance_matrix == data2.travel_distance_matrix
        && data1.travel_time_matrix == data2.travel_time_matrix
        && data1.energy_consumption_matrix == data2.energy_consumption_matrix
        && data1.locations == data2.locations
        && data1.location_groups == data2.location_groups
        && data1.product_categories == data2.product_categories
        && data1.specific_products == data2.specific_products
        && data1.requests == data2.requests
        && data1.vehicle_categories == data2.vehicle_categories
        && data1.vehicle_sets == data2.vehicle_sets
    )
end
