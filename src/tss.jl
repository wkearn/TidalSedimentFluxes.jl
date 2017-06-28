"""
    TSS(t::Turbidity,c::CalibrationModel{TSS,Turbidity})

Given a Turbidity time series and a fitted CalibrationModel (from TFC)
apply the model to the Turbidity to produce a TSS.
"""
TSS{R,S,T}(t::Turbidity{R},c::CalibrationModel{TSS{S},Turbidity{T}}) = predict(c,t)
