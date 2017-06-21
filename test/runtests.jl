using TidalSedimentFluxes, Base.Dates
using Base.Test

obs1 = OBS3("T8271",[0.0741962;0.0456691;1.40e-6],250,[-0.1695174;0.1828727;2.30e-5],1000)

ts = collect(now():Minute(10):(999*Minute(10)+now()))

r = rand(1:1250,1000)
a1 = AnalogLow(ts,4*r)
a2 = AnalogHigh(ts,r)

T1 = Turbidity(a1,obs1)
T2 = Turbidity(a2,obs1)
