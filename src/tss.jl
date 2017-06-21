"""
A ``R``-valued time series for total suspended solids
"""
@quantity TSS Real

TSS(t::Turbidity,c::CalibrationModel{TSS,Turbidity}) = predict(c,t)
