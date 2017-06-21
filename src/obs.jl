struct OBS3
    serialNumber::String
    lowcoeffs::Vector{Float64}
    lowrange
    highcoeffs::Vector{Float64}
    highrange
end

@quantity AnalogLow Real

@quantity AnalogHigh Real

"""
A ``R``-valued time series for turbidity

This is intended to be expressed in 
nephelometric turbidity units, but could
easily represent turbidity in any unit
(Quantities are generally unit agnostic)
"""
@quantity Turbidity Real

function evalobs(x,obs,low)
    if low
        return @evalpoly(x,
                  obs.lowcoeffs[1],
                  obs.lowcoeffs[2],
                  obs.lowcoeffs[3])
    else
        return @evalpoly(x,
                  obs.highcoeffs[1],
                  obs.highcoeffs[2],
                  obs.highcoeffs[3])
    end
end

# This is another functorial transformation of a Quantity
"""
    Turbidity(analog_low,obs)

Construct turbidity out of low range OBS3 measurements.
"""
function Turbidity(a::AnalogLow,obs::OBS3)
    aq = quantity(a)
    b = [evalobs(aq[i],obs,true) for i in eachindex(aq)]
    Turbidity(times(a),b)
end

"""
    Turbidity(analog_high,obs)

Construct turbidity out of high range OBS3 measurements
"""
function Turbidity(a::AnalogHigh,obs::OBS3)
    aq = quantity(a)
    b = [evalobs(aq[i],obs,false) for i in eachindex(aq)]
    Turbidity(times(a),b)
end