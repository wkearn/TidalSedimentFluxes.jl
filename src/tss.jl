"""
A ``R``-valued time series for total suspended solids
"""
@quantity TSS Real

TSS{R,S,T}(t::Turbidity{R},c::CalibrationModel{TSS{S},Turbidity{T}}) = predict(c,t)
